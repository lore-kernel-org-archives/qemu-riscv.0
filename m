Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7EBC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 04:06:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Yob-0002l4-8G; Mon, 12 Jun 2023 00:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YoC-0002gz-VD; Mon, 12 Jun 2023 00:05:46 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Yo7-0006bq-Ol; Mon, 12 Jun 2023 00:05:35 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-45eabad43c4so1548782e0c.3; 
 Sun, 11 Jun 2023 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686542730; x=1689134730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knGD8Qo8E0F8XDKD5vx5h5+Sd7hS8F9TjerkqIUq6yk=;
 b=Ucr2JKq7kXfbXa6+S+Po0pmqflExvwUsqtGNyPVHNs3IdznjJK2kEzOV4NjsKK0IJG
 DqMTEagflGZp61Ofp8IIgZ3eob1QeldGSCYQZYciDHFDhPvOIBk5wxbx5UHhjFrN3aNu
 5dul9Xs2CFneEqAtpysHnalE+2IkY9g0KTZGGsacCCyPSIMkd9zQsIiF4/qrbwDABNk3
 HZdsmNBGYJWiA5Rtd9SbfpOIPSlZm2BOxkXHwrHj27EnrMQ2HlpAqmASU/k8Qevx1+mF
 Ql7YUgZ993qagt3/+598UkhkfrfnvTX4vyyNFXNlStXfLz2hQ7hwv5zlfctf8qWpoLxQ
 7Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686542730; x=1689134730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knGD8Qo8E0F8XDKD5vx5h5+Sd7hS8F9TjerkqIUq6yk=;
 b=asZm7LBFiMgDr7/cWCYIPgv6AN1aEpImLhURBr9Gwa9muXwBRHQUNkwCsf+3CMPIvl
 HzrpisvAB/BeYkd1CaTFw9ucS6DgFMLClQAOg218EpHK5R4CXwGOQBYFzoIuV5hzLdSv
 x70qiICqONQqnlHgii1ISQaHeAGuuoIj5IDD89gF1CJMbCDVXJZR9//zmvvS5aZoIZ6p
 v4Zjbyy5agcC6vWpRMFUVxEJOwYDBXD8LubYTO0Agi0FlT3MufVArLeqt9vlAJUzLhn+
 lzf8Gs+jtQ5hXQ5I3fIl0AWUoogsOslds7TnOEmUdsDOsuJkZc83h+HlPzqWi63r3mU3
 qEZw==
X-Gm-Message-State: AC+VfDw1R4fq7Yjf354j7vrVrhnoIrdKBEgGqQt4HSYQDnqWxCed6vDf
 GbeCsPFupSTdNu7EUpEr4MgYiXY3z3FvzH2bU+0=
X-Google-Smtp-Source: ACHHUZ7rwxPIR8AXMGphRdl7zrgr5UDizyJeIlGPhiowbHwS1EDOnBA695IsxKXVR+1rTCrY0WkQYQGwnGzpKDjHp9Y=
X-Received: by 2002:a67:eb4c:0:b0:437:e5ce:7e8f with SMTP id
 x12-20020a67eb4c000000b00437e5ce7e8fmr3521063vso.4.1686542730388; Sun, 11 Jun
 2023 21:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230530194623.272652-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 14:05:04 +1000
Message-ID: <CAKmqyKMZPSMTGHQizrsMqNXqu2fQiFjuuGUmj=mxmPB5iL5-hg@mail.gmail.com>
Subject: Re: [PATCH 07/16] target/riscv: read marchid/mimpid in
 kvm_riscv_init_machine_ids()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Wed, May 31, 2023 at 5:48=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Allow 'marchid' and 'mimpid' to also be initialized in
> kvm_riscv_init_machine_ids().
>
> After this change, the handling of mvendorid/marchid/mimpid for the
> 'host' CPU type will be equal to what we already have for TCG named
> CPUs, i.e. the user is not able to set these values to a different val
> than the one that is already preset.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 37f0f70794..cd2974c663 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -378,6 +378,22 @@ static void kvm_riscv_init_machine_ids(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>      if (ret !=3D 0) {
>          error_report("Unable to retrieve mvendorid from host, error %d",=
 ret);
>      }
> +
> +    reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(marchid));
> +    reg.addr =3D (uint64_t)&cpu->cfg.marchid;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret !=3D 0) {
> +        error_report("Unable to retrieve marchid from host, error %d", r=
et);
> +    }
> +
> +    reg.id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(mimpid));
> +    reg.addr =3D (uint64_t)&cpu->cfg.mimpid;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret !=3D 0) {
> +        error_report("Unable to retrieve mimpid from host, error %d", re=
t);
> +    }
>  }
>
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
> --
> 2.40.1
>
>

