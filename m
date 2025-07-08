Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB124C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:41:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZG40-0006zO-5O; Tue, 08 Jul 2025 17:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1uZEhB-0005ZP-Sf
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 16:13:43 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1uZEh4-0005iZ-Pv
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 16:13:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-23508d30142so58716935ad.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1752005613; x=1752610413; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzL69JQNXTzzWE+QcQYF9KB+BS9wTnI7qk0XtFQ0Klc=;
 b=eNV1ogzmmLKOAPWwDXBdWQy99F30CJzXUa6aZZY0dHo5OM3kwOU8R7kWjWmSlowjzc
 ef2vVknQhJ9dcJDGC8TR48wIJPBy1orl8mEdiGn0GprEabDdL/SKpOvhpbBIrUixaKi0
 K340JVDfAJty8h9mQegPGxsqeo6QNvfg3Faapm8se5ryOPYwQJkToaHj+0IuiS28EsaE
 aQiUFVd0KDpnYGWBMPJ7XYFvPv4JI/daXdPrtlxmI6EMzwMRD9HJEX84Mn/QivGb3HHK
 gEzj69usOY9Vb6wm6PKeRtAnnkwU3TSfotLgcvMW+OC0dxsYHp2luOxKYFQEaTvWaLAm
 xBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752005613; x=1752610413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzL69JQNXTzzWE+QcQYF9KB+BS9wTnI7qk0XtFQ0Klc=;
 b=d+n3oVrxHv3CUKPCESte+9gI6TKSm3LEysYCt+4Li8JPhY1e40rbCjqigxvEtecmD/
 R8A5mnRdpUQDN3+KFq4zGRx4We6E7XjaG80J//CGRs8l4du00xP1eA6ItStGyxbP8xTZ
 KoA3PxDGHVNL8bm++USrJTn5I8yjzze+rHGf7FcaWlKFg/xijmKgLSs260pe9sZ6KhLU
 X+xXw4hau8roz2hk/ahUZ/+r5PJlm67Y/zwdAOFbRYoIKlgI+G++8nl9/fS4IQlRagPC
 uMogDxGYZxYJ6BIbxIrYcq6bu4/aeK9w7pEcHx6It3FTS8pCorQSg+W3se9pGxvMV7Rt
 Kn/Q==
X-Gm-Message-State: AOJu0YySvf6+4gpENFE5QeQLlOx0vR/Z3ZRxfd/EsiBo/WE2rlICdGtj
 hDoXbQNOexPdB+DcRSHivgLBxC4WI03mIAjaanqzdP+fnbM3kKMtYcDBqnb2jTlSlmkis/9OD3Q
 as49K6g8v6B1HVQwwZunQTfcOTYcq9lKEg7q+92YRxCDdZ9gZCZSnl2PloucZVkc=
X-Gm-Gg: ASbGncuT8CKJJsfNa56qP5ZDeOeDrkJAltjrtd3KqFqKhijiRcJGPVZfrKpYTpswgv5
 +HdYGtRDsrRxRRmHG17dRc8kMRznZBpojD29JB1be0pxMqYtCVJxH7D4jIQSbc0zBXN8Umf2DYa
 /e9Yzr9WFR+BV098meYcDD6vqSf9qPU1YgabwqucI1xzVNmMGS7iTfM8ByMyzYTJ9r5Tg=
X-Google-Smtp-Source: AGHT+IEIj2+OWKEuHs/WuoR1eHIFaMEkUiiAoexdclbWszfNjKlbljISmiozjKqu3DLZwa3dMJvA+vOwNUlre/uap3I=
X-Received: by 2002:a17:902:f60b:b0:234:bfcb:5c1d with SMTP id
 d9443c01a7336-23c85eb06ccmr239449995ad.40.1751963564698; Tue, 08 Jul 2025
 01:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250708060720.7030-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250708060720.7030-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 8 Jul 2025 16:32:33 +0800
X-Gm-Features: Ac12FXzx9nI_d6ljKnI48H3U1qt08GGNwpDcdOt0sS-TtGK4-7kgkxLq6cHAV3s
Message-ID: <CAPYmKFv9ye2_r5iMme9EXFyP8FKm-bkRb92_0XSK7kwnY-tONg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix exception type when VU accesses
 supervisor CSRs
To: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, apatel@ventanamicro.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=luxu.kernel@bytedance.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

FYI, the discussion about whether vs insn fault or illegal insn fault
should be raised can be found from [1].

[1] https://lists.riscv.org/g/tech-privileged/message/2469

On Tue, Jul 8, 2025 at 2:07=E2=80=AFPM Xu Lu <luxu.kernel@bytedance.com> wr=
ote:
>
> When supervisor CSRs are accessed from VU-mode, a virtual instruction
> exception should be raised instead of an illegal instruction.
>
> Fixes: c1fbcecb3a (target/riscv: Fix csr number based privilege checking)
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8631be97c5..9bebfae3f0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -5577,7 +5577,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>
>      csr_priv =3D get_field(csrno, 0x300);
>      if (!env->debugger && (effective_priv < csr_priv)) {
> -        if (csr_priv =3D=3D (PRV_S + 1) && env->virt_enabled) {
> +        if (csr_priv <=3D (PRV_S + 1) && env->virt_enabled) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>          return RISCV_EXCP_ILLEGAL_INST;
> --
> 2.20.1
>

