Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYvG5-0006VI-QN
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 15:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYvG4-0006Sv-0F
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 15:47:04 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYvG2-0006Pg-1W
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 15:47:03 -0500
Received: by mail-pl1-x630.google.com with SMTP id v11so8152999plz.8
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 12:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678049219;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=3my9w5dZJEPiGf5Jw/70zkeUmR4DkwSaOGoJgZWxWRo=;
 b=b+owVsXSSt0Dtel41Yc4W4raHDXCJodCUYVLzWsiGJ/2YXlHU1i1oDXQQSU2B1xnFB
 9yk6/h5lerhI/GsyGhIMc4DimT2Ih+Z9YES51n6cR3HgmEtoxjmAheaOmgSW5HTwa8w5
 9NeQmB/EEchE2iYEhcVZxlF5NPYmlp/6HWjlgpH1WDDX5EZ4aKZKJA94W6TWuSbYzBXm
 ibzu8+/5+su0ErEyOo2LWwhgnR8BMV3pjI/DvISbJiXuLih0CWG4ysKAl4M5vbmewd1K
 d8jO6pO/3KwuVzCIddmYMVZZ+hyewXIN/HxFfjNCbTL2lUJPPPyEStJzVqGzSsi/fmIb
 zo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678049219;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3my9w5dZJEPiGf5Jw/70zkeUmR4DkwSaOGoJgZWxWRo=;
 b=qYsCpuKLLBHrXJjZ5hgIe8kEf/+Yi+yG9J/WbXuNOfGDbL5p7hCV+y9TNB7LUIvGgD
 t3b5kP8T2uIQsUYWES8chHPeWK3X6d2b/9Kiz0m5WdFaadYJHez2s73WQPXFUNcH7Wxj
 MFJiZ1JBb9FhswQ0de+FV3Piaf5IAJ2o8AFooA8wlKltLB6xbvifnyDwFTY3UMQsUy+N
 VQnBgOo8JGGZtx6sz/te0AK4nWYoWXFi4n3WQc9Bivxg8sdm8e/og4Q6Xbqnw9tobSsn
 7fux/Uz60B3zdwlqVdPEfj4H+MjubZ2ZDyMvHY3awBG28kRrgf3Egh+Y3cAPpelsfCt2
 kg1w==
X-Gm-Message-State: AO0yUKWKUd2O4XJuDcMFVl/qGK4EoDiV1WiE1mLdUVwMfUaIOYDzGgd0
 Tm60IO3dCzU/5faCPhmWW3pEaA==
X-Google-Smtp-Source: AK7set/n3c8/B5a9hXAc/E1l9Iz9ah18U8/yNd2FTAglrv5y1Zvqq7Ln9vDFEY+/dTgwNHhPWtuytQ==
X-Received: by 2002:a17:90b:3890:b0:23a:6d16:8e36 with SMTP id
 mu16-20020a17090b389000b0023a6d168e36mr9191616pjb.12.1678049219409; 
 Sun, 05 Mar 2023 12:46:59 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 v7-20020a63f847000000b00502f20aa4desm4969605pgj.70.2023.03.05.12.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 12:46:58 -0800 (PST)
Date: Sun, 05 Mar 2023 12:46:58 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 12:46:06 PST (-0800)
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
In-Reply-To: <20230217151459.54649-1-ivan.klokov@syntacore.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, ivan.klokov@syntacore.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ivan.klokov@syntacore.com
Message-ID: <mhng-b7567a6d-04f6-4562-a43d-4c32cf50e331@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 05 Mar 2023 20:47:04 -0000

On Fri, 17 Feb 2023 07:14:59 PST (-0800), ivan.klokov@syntacore.com wrote:
> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
>  disas/riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..d0639cd047 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1644,7 +1644,7 @@ const rv_opcode_data opcode_data[] = {
>      { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },

Thanks, this is queue up on riscv-to-apply.next -- I think I managed to 
get all the reviews and such from the mailing list, it got a bit 
confused.

Here's what I've got:

commit 270629024df1f9f4e704ce8325f958858c5cbff7
gpg: Signature made Sun 05 Mar 2023 12:43:52 PM PST
gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
gpg:                issuer "palmer@dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmer@rivosinc.com>" [ultimate]
Author: Ivan Klokov <ivan.klokov@syntacore.com>
Date:   Fri Feb 17 18:14:59 2023 +0300

    disas/riscv Fix ctzw disassemble
    
    Due to typo in opcode list, ctzw is disassembled as clzw instruction.
    
    Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
    Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
    Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
    Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
    Message-ID: <20230217151459.54649-1-ivan.klokov@syntacore.com>
    Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..54455aaaa8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
     { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },


