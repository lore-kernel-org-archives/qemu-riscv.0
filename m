Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXWrx-0006dK-S4
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 19:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXWrv-0006Yp-JW
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 19:32:23 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXWrs-0002Pq-9c
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 19:32:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id ky4so15900228plb.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 16:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677717138;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=8zsRl9kyWT5UFtHiZZ3fTvUpSfqyJxcDlpVmnPB27mg=;
 b=oaPSUx6b+JA//EgK4pSkMIGK4ejcTOy3oL1m/S+IE5rF9o2fldp+6jR5x5zA76cTqW
 VE4AjWcq77DpHbluHh5Br3Ncw1PLV4PnsX36tZLIyUgr5CB7iFq+MtRpkZPJYDO3Busk
 LPFM2VHWNqtF6QY2+U/EU1cUJxtYU2vAoaQMCd+stzP7P845737+e3rLRPI8KFIzg7Vf
 rDKfpPzzctEsB24HmVMNfEurefTBDG4nsU7bwtpblXhR+4l2vRCJdfNiBtLsSUWiYRWL
 /75DLoRDqLt0aoih5Uy9SjP3VM1gRq1e7lPJatKtXJ9xIXZTNwjhKYSTopcZ8jXtEtRg
 4D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677717138;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zsRl9kyWT5UFtHiZZ3fTvUpSfqyJxcDlpVmnPB27mg=;
 b=ggnDEbXAdWcZvLCCUKcZgAUEuKekPhebfkXCN+oX0Y0qG2T6TfmpFek5g/PIgNg12y
 84TivrtcVOhoJA2TXOhiK6NvDBus5WrTMezFYhSIAnwkPydM8cZvh5AryUq53MqvUlnT
 FWKhWOhvm1xnd54ibh1XsMrt6MFEUcKDhkN8PQ5SxaD4NjCFCL5Dl1+4zBLL00i/gAqe
 RC+75YuopWDECQIcz20MEsBcZ15t+DeP2877wcaLBIQ9sgoH4VghrEQCCDMs4syibMDS
 as98m3Ssr1dQHEibw3AMHiF+ZbtsWng9VzvM3f7iGF1SMPuF5xaUf1zKqnKjQ3wdLgr7
 tS3Q==
X-Gm-Message-State: AO0yUKWW51snY+GJhG4KYVeG3ShKqdn2qBWDgqfr+2CmkSFcwmAGltkO
 FiEAbkhZcqQ3ChJE+5HGlgWlfQ==
X-Google-Smtp-Source: AK7set+gu57leAzltyrk7j9MLooKKqVhCfQvxTzdhpkQiK+Ia4cAOrqc0/93ro8+2jvx0D8HI3+PsQ==
X-Received: by 2002:a17:90b:1b03:b0:237:97a3:1479 with SMTP id
 nu3-20020a17090b1b0300b0023797a31479mr9644524pjb.28.1677717138075; 
 Wed, 01 Mar 2023 16:32:18 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 h24-20020a17090adb9800b002349608e80csm317232pjv.47.2023.03.01.16.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 16:32:17 -0800 (PST)
Date: Wed, 01 Mar 2023 16:32:17 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 16:31:30 PST (-0800)
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
In-Reply-To: <4acbf2e9-ce6d-7d02-0435-485ecf3184b0@ventanamicro.com>
CC: ivan.klokov@syntacore.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-542399b9-3e5e-4c0c-a5f5-97dbf16f7554@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 00:32:24 -0000

On Fri, 17 Feb 2023 07:45:14 PST (-0800), dbarboza@ventanamicro.com wrote:
>
>
> On 2/17/23 12:14, Ivan Klokov wrote:
>> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
>>
>
> The code was added by 02c1b569a15b4b06a so I believe a "Fixes:" tag is in
> order:
>
> Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
>
>> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
>> ---
>>   disas/riscv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/disas/riscv.c b/disas/riscv.c
>> index ddda687c13..d0639cd047 100644
>> --- a/disas/riscv.c
>> +++ b/disas/riscv.c
>> @@ -1644,7 +1644,7 @@ const rv_opcode_data opcode_data[] = {
>>       { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>>       { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>>       { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>       { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>
>
> Does the order matter here? This patch is putting ctzw before clzw, but 20 lines
> or so before we have "clz" after "ctz".

IIUC the ordering does matter: the values in rv_op_* need to match the 
index of opcode_data[].  decode_inst_opcode() fills out rv_op_*, and 
then the various decode bits (with format_inst() being the most relevant 
as it looks at the name field).

So unless I'm missing something, the correct patch should look like

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

The threading seems to have gotten a little screwed up with the v2 so sorry if
I missed something, but I didn't see one with the ordering changed.  I stuck
what I think is a correct patch over at
<https://github.com/qemu/qemu/commit/09da30795bcca53447a6f6f9dde4aa91a48f8a01>,
LMK if that's OK (or just send a v3).

> If the order doesn't matter I think it would be nice to put ctzw after clzw.
>
>
>
> Thanks,
>
>
> Daniel
>
>>       { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>       { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },

