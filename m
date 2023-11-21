Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E41C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:44:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Hg0-0007tO-Lf; Mon, 20 Nov 2023 22:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hfr-0007sa-UR; Mon, 20 Nov 2023 22:43:44 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hfq-0006ck-13; Mon, 20 Nov 2023 22:43:43 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4ac459d7962so3001063e0c.1; 
 Mon, 20 Nov 2023 19:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700538218; x=1701143018; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45UMSoz4sYxEioNPZLqNCmHoFl3qz9OvdCeplSuj5zc=;
 b=kBuJcANgA9UjQYu2WfiIY41wBaxXcVTh6BAOdz5jl9TtI/nVrVfzUi4lY6HU2QTduT
 euku32uKumQZj5PUTvcH8s4O9tPOcUc3Dp3iaKL/JHqOujSWv7sg20a5SriUqiJWNaE4
 Xrr4H2rAWkv6HtcVq/4mO6AIgpWmnj6CrOpvjF44OZ+oqnNk/X0vZTmic/MZJVT9EmcA
 yeAACMTpbLk6dmqkgOBaMEpI2EPXcnDL7l9WgjuwxrXXrWkfsslMVFYhl14lKNxQpxwC
 Ewgn/PtpUP9ucKGgu8MagOIrHAvVGBx8gHrV9UGiZaRH4+/4ZD3woaTO9GHOvI40LHV+
 djNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700538218; x=1701143018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45UMSoz4sYxEioNPZLqNCmHoFl3qz9OvdCeplSuj5zc=;
 b=wbtrO78dXlc3KUp88lVrAFJ/EFIVdbFONAHjSPp5UMIaQnxmMhh5AKKvwtrCCZe088
 T4G1zPV3jm30aOQ0pA7SJn9pDBNgO9pHLelbXkv4cavi9Zt1zpfOqkWSlRFqv0HMY0rF
 1tJf21JNQM5GvWI53ebTEVLXnVeHaijDQvHLoeNvmnWFFqwlKML3jkwALggciBBPwWeA
 7M/TrjnW1R4fFhTwvmWg9NswOS3z0R1aeJZGaW6JIO9Ila2VggSyYp4cKcfoOreBhmxG
 vXtRxyO6H2jTYyJyeXqNLyWmfct3Ua4hhsrw75TmIDF8pjzhxo5t+zBs5Ag2grJraSd+
 T/QA==
X-Gm-Message-State: AOJu0YwILCp04IpG3+n6KbnTSvjf2/jUWoCYhwbkyeYsBhreWD15ujy5
 24ThaNxqeGuqelfEV77qkPyBQMwwZMjgRQfI5DU=
X-Google-Smtp-Source: AGHT+IE4TF4a8bvlrt0dv6cEpILmwzydp1mdIuDAbycy9+5NMDVWZWDdJxY4MQxBRCXdAJV/sYYFJqjaH8j3p8SLdrY=
X-Received: by 2002:a05:6122:2216:b0:4ac:2054:6a27 with SMTP id
 bb22-20020a056122221600b004ac20546a27mr1688471vkb.2.1700538218252; Mon, 20
 Nov 2023 19:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20231114123913.536194-1-chigot@adacore.com>
In-Reply-To: <20231114123913.536194-1-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:43:11 +1000
Message-ID: <CAKmqyKNN8bapFOPo1hGQUOmKf0p=DsOi3Ms9qMNwBK_vV-fDdg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: don't verify ISA compatibility for
 zicntr and zihpm
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, bmeng@tinylab.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Nov 15, 2023 at 12:46=E2=80=AFAM Cl=C3=A9ment Chigot <chigot@adacor=
e.com> wrote:
>
> The extensions zicntr and zihpm were officially added in the privilege
> instruction set specification 1.12. However, QEMU has been implemented
> them long before it and thus they are forced to be on during the cpu
> initialization to ensure compatibility (see riscv_cpu_init).
> riscv_cpu_disable_priv_spec_isa_exts was not updated when the above
> behavior was introduced, resulting in these extensions to be disabled
> after all.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> Fixes: c004099330 ("target/riscv: add zicntr extension flag for TCG")
> Fixes: 0824121660 ("target/riscv: add zihpm extension flag for TCG")
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08adad304d..8a35683a34 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -250,6 +250,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RIS=
CVCPU *cpu)
>      for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
>          if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
>              (env->priv_ver < edata->min_version)) {
> +            /*
> +             * These two extensions are always enabled as they were supp=
orted
> +             * by QEMU before they were added as extensions in the ISA.
> +             */
> +            if (!strcmp(edata->name, "zicntr") ||
> +                !strcmp(edata->name, "zihpm")) {
> +                continue;
> +            }
> +
>              isa_ext_update_enabled(cpu, edata->ext_enable_offset, false)=
;
>  #ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> --
> 2.25.1
>
>

