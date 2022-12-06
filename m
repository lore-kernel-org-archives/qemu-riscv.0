Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2S2C-0007BA-Dd
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 02:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2S1q-0006zR-6t; Tue, 06 Dec 2022 02:06:10 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2S1o-0000SP-Bk; Tue, 06 Dec 2022 02:06:09 -0500
Received: by mail-vs1-xe30.google.com with SMTP id q128so13324373vsa.13;
 Mon, 05 Dec 2022 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XcqP69H7M8h20Oke/Zb/63PVRm6MLB+zw6z4Mmx26F8=;
 b=BLyfwb6oAkyoQOUHfznTFgSEElm1Na3kMvqiokfuVUTETZ6D/E3rOCNvyAQHbL/+Z4
 OLnR69Xj/1sYG3rDKZFEs4W1f4xrR0o9ncOzRAHV3VpZo8nf6Vj8S3d5Ai+QLRLPp32E
 sv+6w+cbCg5GcylLUwX4/ur957K9qQgxucpRSaa3Kt8Sjasw0NdpcKl4USh0SwFCKeXO
 0tQX82LQ32AGmk9kFEuGO5juykIwKs73nZ89dHj3eAcjWoSdAipUYl1YKMA1ihaaFevO
 gwqo/JiXOEEZs6N57wqoOcO7nUUQ1BWLYIHcqZJ189WITiLdCiNch+E0voFxPFPXMY4T
 iXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XcqP69H7M8h20Oke/Zb/63PVRm6MLB+zw6z4Mmx26F8=;
 b=z+HWuxOLKbAnv7NxJkKBY6reIFFuPyUlmGLOTO8o7Vt2CmVsbxXMPOFy4RJkAzRVGw
 8VWXpRv02EAnjE1AToLSXaw/5MUDNMW6OpcHCaWO1fmdFxXuukNzJDJAE0PGJ6XvMOBh
 j2F8McsdaW3Jx5uk9eT0DvbQXx61uXJDaJFiypPg21+PkzeY10W+HQcJboMqdhpdtR9V
 TGilObcLyQaisRb1iTuxYGx2SLPEuQUiwQ8AygEblN2FQmxbFrhMk4GOlHu3+nWdJIta
 2rsjx1juUUHzx7HITzw+HsrqyldpVzAtsTkGAzOkLQlkein3KPwx9Hg5UmlMy++g+btn
 FN9A==
X-Gm-Message-State: ANoB5plqWsWqiuGiS3mHD84k70K7821YMjbVSo4vLZU8lOTa0YHl103p
 JMoCvjZZNmy1btgmR6hh+WKbb27j5uzL456Ejj8=
X-Google-Smtp-Source: AA0mqf7St4C13viAAf2JXUvpURaCk7ywfVncZmfAknhYnyO82ozCh8fpsX8F50I15v2RZcUt4h+f1HfiFk+1k2KYqAw=
X-Received: by 2002:a67:c519:0:b0:3b1:2b83:1861 with SMTP id
 e25-20020a67c519000000b003b12b831861mr5897148vsk.10.1670310363287; Mon, 05
 Dec 2022 23:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20221205065303.204095-1-bmeng@tinylab.org>
In-Reply-To: <20221205065303.204095-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Dec 2022 17:05:37 +1000
Message-ID: <CAKmqyKM-F=ENKQ_onOmFBPnzuhiLZcXGQcujCEdusrpa1GwiBw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix mret exception cause when no pmp rule
 is configured
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Tue, 06 Dec 2022 07:06:29 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

