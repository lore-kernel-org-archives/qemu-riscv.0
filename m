Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC39CD98F6
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:58:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbVnO-0007zi-Ev; Sun, 21 Jun 2026 23:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVnC-0007yO-BF
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:57:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVnA-0006aS-Rl
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:57:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bed2195323cso596979566b.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782100667; cv=none;
 d=google.com; s=arc-20240605;
 b=IAnWeDqm8pYqb+jgBAMbPwU7Her0tZYo/TZeKIQojpfyQblGKiLsK2VH1V1xnxlBaM
 8Y5ZztTTr4r7wVODpMlG6tTzx8rz709zwlk2QVAskrrXGaykfwFYB0Gi4Q9HNtfy2ndx
 1Fyef2pMaNrYxfO+p6HJ78QEKSypnlu98BBL+YsGUZ5gbi3cIypRdFh9RwpB4ry7x8qK
 qvU+8IuZ8lv/uiqoNBkhgdST8rJFY1YmPorvzAXQUjPERsdqFpUDaMqthHucoxLfeRv/
 k8jRSueYC2+eXEAViWZ+JhK25xqvpWwVxMfBuJPAeb5jo+/u/9PBnBk60DF1sdaNxWbk
 F3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BGujD/kdKMrLCJF41tGVPhLWtBdN2/9YXhZzjuo1kkc=;
 fh=k5iwLL3CNXQOhN6o2sGYVOB/BF09Qu9r9rFBDzolGuo=;
 b=VgEFJYij5rsxfctAptyFP8RebCu/KDZtuyaQuhmpogPoMLwJc0/OjrYPeC6BmrThub
 xVXtMkqvwnSHEZyT/KdhJQP2fqVBT25gm9oVDbAC0kwiEsVL2FNOJxWxG7VMpyg6PMKp
 GNT1KmSjKQy8R4CisSAsplTvwYdREiHh2vlOiFlxDQ39YXQlRHJvOHL3rDqw1PmafXkk
 C4q4nWarHpD/p/GS9CMY3Zz1VBMyXRGorTFqXFzOXbFe7k6FE3ckHI74DIs6FqD6ep+0
 ySq50SW9335GP0GHenfC2vWaTBiUeMS3uRlAcepc338zSUt4+5AQmxXIZ4BGaxQzK2KA
 hYsQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782100667; x=1782705467; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGujD/kdKMrLCJF41tGVPhLWtBdN2/9YXhZzjuo1kkc=;
 b=hVaUsOsQsPgq4EKsMEsE1F2cljSjV4bEtwSrnNzz0Bm/74SzZwMbH6m3ajn63ziyx9
 nWewUC9K4HCv0+pMA398IUNmm9JVlGpfbkU+lJ3EnmgPLeX+BvRVfYOFGjZZOmGKDgom
 F1lSxxnHphZ1gBINFzXgtRjgInEOegOfj+8987DTHfUML6TrjrOHtmrEAcmvs3SMUgXI
 jyRcXM4A8GwjWb0v7pZERwieun5LfP1SfvmzE8jWc/sx7mPKLr1TleKwCEDrFNVHd9dD
 kzrH/LYWLH+l9XK6OCqaD1qe4w72zQ5xcBOumnIuOxOqDV8YiSRCkPYHXB7Ia42fXMvK
 SKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782100667; x=1782705467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BGujD/kdKMrLCJF41tGVPhLWtBdN2/9YXhZzjuo1kkc=;
 b=Z6Fg6htZSCCJ9ZcUKa+PvnkPEgGyOJuMAL6hE3+xC6onbSL/2N8Csv9TuDa34pZu00
 cw0b0Nmdnf6C5twMkkeYf7she9rpgBaySGWSUbCyNj7oLv0brdxKj6l1IMJStnxnAgY8
 hVx6DmufIt9PC5YkHfj0r2onu3X4a6hASdGq0+mCX+L8eha+20LBoQrIdN21431Tp4eo
 WSfxnEBtR/MEqGrB+zOkFiP4QReSNYp5P+92lKTNngd6ckyyTRot6YWyy1df0uJ3DoZl
 OfdSwb9ZnJ9P644W895BQfs5f0FZ0QduGSE8gp+mSr4mxVYEgZuGX0DGckMt+OpfRzj9
 H3jA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9tQaRdZc6sL0gzwdkNipZ6Wln+tpeZcZB74+0wpoaotkVvikI5FXSbVExvsQrwwPoRIP3inbI9cuk@nongnu.org
X-Gm-Message-State: AOJu0Yynpz+atn1u8E73JLx5+monkei1Felt6G9z/7XN1eI1MZUPIyGD
 v+ZvGimwdE8H6nZJQX3nIf1iIFBNIaa7iWcwBlFvMTid+c7p0cK4QB6JuJM+G7T5c9QBh38JZt2
 qspJDKcuMOd8IeOic5SBJckBXfQtWJ2M=
X-Gm-Gg: AfdE7ck1j7HQ392XnoMlHocMHieAJmzIi+9NCFvg9cNrqZTy1YCTJxBpoiwfjMvVJ3A
 VDMgYWdcPCa/5be6J1nMz/qgm2/IfpH3t6zXxHel3jNXZZHVXO00X4NqxErLGY6EoN2Xy3LjWPJ
 aMlYj3QpoT6QS+lGmJnSlwkm2w7fQRrsrwR/1PG6/f62WfZbczOI396x8dzSQOFMiPmx76diFF1
 93umnuQGX8eBAtYgFpXnq4BlIhpxCRH9ZpvIC6bR6ovq4sgpM9ovZXlxxac8hHWr0z5ld/AhA3T
 yKYOWZhidq+bhmEiPCBH5e6VGsCvql8Gj8vtzw==
X-Received: by 2002:a17:907:a785:b0:c08:7c11:8dec with SMTP id
 a640c23a62f3a-c0b61547008mr502437966b.21.1782100667006; Sun, 21 Jun 2026
 20:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
 <20260615131925.3019370-2-qingwei.hu@bytedance.com>
In-Reply-To: <20260615131925.3019370-2-qingwei.hu@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:57:16 +1000
X-Gm-Features: AVVi8CeEQOwLn8D_e97TdPaiHDuz_MZQwxz3LaqzJUGoaxqdFXgIzi5KEB8bGJs
Message-ID: <CAKmqyKNfsrTwHT2uAFS-cuR=PqqzAdhzUzAJjLSZ-2Uwqog-uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/intc: riscv_aplic: Skip reset for KVM irqchip
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jim.shu@sifive.com, nutty.liu@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jun 15, 2026 at 11:20=E2=80=AFPM Qingwei Hu <qingwei.hu@bytedance.c=
om> wrote:
>
> The emulated APLIC state arrays are only allocated when QEMU handles
> the interrupt controller state itself. With KVM AIA/APLIC-IMSIC, the
> interrupt controller state is owned by the KVM in-kernel irqchip, so
> these emulated state arrays are not allocated.
>
> The APLIC reset handler still clears those arrays unconditionally. This
> makes qemu_system_reset(), which runs during machine creation,
> dereference NULL pointers with -machine virt,aia=3Daplic-imsic and KVM.
>
> Skip the emulated APLIC reset path when the interrupt controller is
> handled by KVM. The emulated path is unchanged for TCG and for
> configurations that use QEMU emulation.
>
> Fixes: 99bfcd329a ("hw/intc: riscv_aplic: Add reset API to APLIC")
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aplic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index c2c67c29e6..84606e9f3d 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -910,6 +910,10 @@ static void riscv_aplic_reset_enter(Object *obj, Res=
etType type)
>      RISCVAPLICState *aplic =3D RISCV_APLIC(obj);
>      int i;
>
> +    if (!riscv_use_emulated_aplic(aplic->msimode)) {
> +        return;
> +    }
> +
>      aplic->domaincfg =3D 0;
>      memset(aplic->sourcecfg, 0, sizeof(uint32_t) * aplic->num_irqs);
>      memset(aplic->target, 0, sizeof(uint32_t) * aplic->num_irqs);
> --
> 2.47.3
>
>

