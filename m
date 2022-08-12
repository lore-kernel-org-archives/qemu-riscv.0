Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMVDt-0005qI-GD
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 10:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVDr-0005pO-NJ
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 10:01:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVDn-00025F-GN
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 10:01:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gb36so2171427ejc.10
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=UXa0Pabual+iQu/vNcU9hBH3Mwq/wUZ/0AlBXbFhSog=;
 b=ZNNy3GXPS+toKrm0uyMlOEU5SUZ46e+FP+btmYlLVuP2sludnLWKpv0AFpNKxNAx68
 1oQfDDS6oUHC30Mt055WFxkNqyAC5y9lnyQmdwtM6mmZkkLz+xVElUD0as2sTM06KyEO
 mPqEA4EboD2PZXqdatGhr8WtH4PBqaKjRfOtlOhH4Y84LbXZ/T6ux7SqMqbLbn+MrK3z
 otiZHJouhZFy8irk8wUP5Ujmvwlnds+dRXeAtozLFfEnMdGaQh77d2Un9Fo0c9EIxYej
 zoQ38XpwbHleYZS1jaLeaE2FEiHj5e0IoFnmEKhJ1g5ip6kUQQ8pvxpnlIQGzuvFMQu0
 /XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UXa0Pabual+iQu/vNcU9hBH3Mwq/wUZ/0AlBXbFhSog=;
 b=HaRR4vR6cmAcF28VeeipP4612gA5D0kBJKaq9xKZG3ZnEpBLsUjG6BP9XxHcW0Xbcq
 Skz1O+LxzWV8M4llN3/xjzG4JrDZWSFaQmlrUUbs2a0tK7mB57+MY5CXvGhQ/aKoxhVn
 WbYrLgWG3hBjZMD42HEVBLsGNQ3Tgrl/N2gGotYwGOKHJOrx0xX7danlhHA7sE5U+SkT
 Y6DXRxQmcQcGn4S9Sw67PjNZU6j5K++mTeavyczLkjThTPl4pF573zi0q4Fw/kA6O434
 tLkUrYbHVq6d1IWSgHZD5gMKBM67bCvI5IoAzMk0+ie42TjX3msy8W2Tr+ABjf06Kc0r
 MNxQ==
X-Gm-Message-State: ACgBeo1LzXMAVoystUg01SnKMbAUNkkzK6Iu8nVRQZwiIm+ME/wdvyPv
 4o3O4mQSaHE2Ar9yZK8tpxOSPA==
X-Google-Smtp-Source: AA6agR6Kxl/DNpwQVTTYqUtdCg5EU0FTw8/EgPqinu2F7pyQBQrxBn4mK2pebVcOImyJ9hsDx1g71A==
X-Received: by 2002:a17:907:1629:b0:730:7d10:639c with SMTP id
 hb41-20020a170907162900b007307d10639cmr2726872ejc.256.1660312865634; 
 Fri, 12 Aug 2022 07:01:05 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 b25-20020aa7dc19000000b0043d668dec21sm1384083edu.38.2022.08.12.07.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:01:04 -0700 (PDT)
Date: Fri, 12 Aug 2022 16:01:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/2] target/riscv: fence.i: update decode pattern
Message-ID: <20220812140103.3lbh45oidiw2fhsf@kamzik>
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2022 14:01:12 -0000


Please use a cover-letter for multi-patch patch series.

On Fri, Aug 12, 2022 at 03:13:03PM +0200, Philipp Tomsich wrote:
> The RISC-V specification specifies imm12, rs1 and rd to be all-zeros,
> so we can't ignore these bits when decoding into fence.i.
> 
> Update the decode pattern to reflect the specification.

I got hung-up on this for a bit since there isn't any "must-be-0" fields,
only ignored fields, but the next patch gives a clue which helped me make
sense of this. The encoding of these instructions with ignored fields set
to anything except zero gets into reserved instruction territory, and QEMU
may legally raise an illegal-instruction in that case, which this patch
will start doing. It'd be nice to have a bit more text in this commit
message to make that clear.

> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 014127d066..089128c3dc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -151,7 +151,7 @@ sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
>  fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> -fence_i  ---- ----   ----   ----- 001 ----- 0001111
> +fence_i  000000000000     00000 001 00000 0001111
                        ^ need two more spaces here to line up with fence.

>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
>  csrrc    ............     ..... 011 ..... 1110011 @csr
> -- 
> 2.34.1
> 
> 

Thanks,
drew

