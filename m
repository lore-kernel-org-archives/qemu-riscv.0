Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2mpS-00060y-89
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 00:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mpQ-00060O-2t; Wed, 07 Dec 2022 00:18:44 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mpN-0007QV-Ty; Wed, 07 Dec 2022 00:18:43 -0500
Received: by mail-vs1-xe31.google.com with SMTP id d185so16285798vsd.0;
 Tue, 06 Dec 2022 21:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TaxMSNqQze7JOghvL+HTxKt+CB+zzcFlKPetssJ5z+A=;
 b=Lbkx4H/I5Zi0msBDlVtcR/hTSxheh5V6MhVBp6zUE3qIj9CYFrlPq0DEq1qPQI3nqH
 598yenFcjxQ4Y42jCuG55pAqb3J1RIVPRlulJMzcru47hf7WaX9tzxw4ejehp8PYugVU
 HXsPTsPdXlN0Q5jFtzSbxfk3D4fym49GNNHvbgFLqZzb3I1u1Ghvokwl3nvJgyqx6eQY
 hLNkNBWSRMXaQiaSwUB94HY/y7ZWCMPHXDXf5bnOzmXbu6Wr7AHMqO3XDz2G5yY6bGBw
 g/Ljonv/tjFxyQDR8+cZfx1H6e6KeZPSUNqq1iMBNx2sOS2y50srFql4MGzQND0MFQ5l
 E1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaxMSNqQze7JOghvL+HTxKt+CB+zzcFlKPetssJ5z+A=;
 b=RAq9AYKOUcDBYIxT1+dj0ZO2PdDWJ/YVymcsbA98+J2dlmb0HCHhW4a+ZbG2OlL06w
 fJoaqL2MdRuJWkex136c0pXLSjO/rY/ZLBUIbt2HTT1LNoRwwcw8hwWUbqFOecmKAaQh
 DtK++2AsIQqt915XIF2glYIfIy0QNAWWakncU/NjkKkVMNxtJCj0pS2r0N2ATeoHFhTa
 w8Karx0BOcfx35jUZ494/kpUfD2nIWYx4XGMJk1rtQL2KkmPSzjCdcocreXT8gaGevhk
 Z9g/H/ZR75sQmhscNAGf7x7sLOJMz8VropZSyaRDHnhI2+ZCLV+0hZxDLaNm9emMjiSK
 rHpQ==
X-Gm-Message-State: ANoB5pkYAYvFbZajy8G3rWmtPcUhSPMA95m/BUFsVOcEgMOS7BRr1rtw
 ct1dB68squb6Oewbx1Si20tt01ijpZmFr3u7NF7xeXWw2uU=
X-Google-Smtp-Source: AA0mqf6h2NPd/WCFAZP4h/TCK+YsBixybfwFLk+2HZaFFri/OcZhPv71UlR5hjipDF5MDEBFbhN53DOgFgYUG8t9ORI=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr14115367vsa.54.1670390316280; Tue, 06
 Dec 2022 21:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20221205065303.204095-1-bmeng@tinylab.org>
In-Reply-To: <20221205065303.204095-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 15:18:10 +1000
Message-ID: <CAKmqyKPUqnU1kg4xGyauZAKXYBCgjiWLQCOr2kWOBxZ2zVYQLg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix mret exception cause when no pmp rule
 is configured
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 07 Dec 2022 05:18:44 -0000

On Mon, Dec 5, 2022 at 4:54 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The priv spec v1.12 says:
>
>   If no PMP entry matches an M-mode access, the access succeeds. If
>   no PMP entry matches an S-mode or U-mode access, but at least one
>   PMP entry is implemented, the access fails. Failed accesses generate
>   an instruction, load, or store access-fault exception.
>
> At present the exception cause is set to 'illegal instruction' but
> should have been 'instruction access fault'.
>
> Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP entry is configured")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 09f1f5185d..d7af7f056b 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -202,7 +202,7 @@ target_ulong helper_mret(CPURISCVState *env)
>
>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>          !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> -        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +        riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
>      }
>
>      target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
> --
> 2.34.1
>
>

