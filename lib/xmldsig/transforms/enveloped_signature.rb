module Xmldsig
  class Transforms < Array
    class EnvelopedSignature < Transform
      def transform
        byebug
        signatures = node.xpath("descendant::ds:Signature", Xmldsig::NAMESPACES).sort { |left, right| left.ancestors.size <=> right.ancestors.size }

        signatures.first.remove if signatures.size > 0
        node
      end
    end
  end
end
