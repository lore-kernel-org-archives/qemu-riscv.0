Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF8DCD98E4
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbVnd-00081S-Kz; Sun, 21 Jun 2026 23:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVna-00080l-Of
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:58:14 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVnY-0006bl-D8
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:58:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6978f0870c9so1533715a12.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782100691; cv=none;
 d=google.com; s=arc-20240605;
 b=lQ/mXB58UZ444Bb6mmMh96A2JjALzjmlLcIUPDktaU2oeOFSfInUid6SP4+nQh9TYC
 Zx5rW5l2poBT34QysSiJmJi2cOOCiKbEU6g7BHmf7elA3DGpuMGCHAJQYCHqsd5fDMfb
 qSUHKHyq/EtKzVmRvD1Yme2ysvJlAQGh2CpAebr/3spYAqq3FG2Mg37EKWTt0tNqLlpo
 uBXF1MkEnCOFYdxmk4swUjYNxlXO/6uQ65XjZyuCRee3hFown6S8SOFqShmmt1WSNVue
 51Y26+kFigk/RT2kGf1VjKqyPiqPJglWumtq/915HDqncb59I9y7TnkKRMZuiM3ehccf
 bSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M6zxMMTMiP24TZJkothVaHHhuOdAx9Dihn0jFOScWng=;
 fh=jUor7lNbgXcwMvXge7s57ocuEbgkO3Rd1mXcIeJA1kA=;
 b=jhG0R0t9WSuQUwBGHiM+B/7pImM4ORX6PuPMKhNmmRbcUz64GraMUVKWpvg/Irzk0l
 rcYu1SPPEAlWhHx3ToPjvItMDMDm8/Fr5LwvI4gM8d2IvPWheTMwzuNPbYg32/OhcDxj
 9j2mUDCpdiFlWUz3Do6cGF/aOSWB1dYXvNSy0G9yvrvIbEASTVIqiX+fY9ltmU0EwH0Z
 I0QY1+HU6vUAs+D9jvM+d7Gvdk1kLjpTw3ctdxOcStZyvjaxs13bZzkuPSR5T1UA96py
 3avdULKIaW8mHgk/TfHnxEV37XZD2l384+51YbJ3FHHEDwK5NiThNKfXQ8WjQaIF47oK
 OVuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782100691; x=1782705491; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6zxMMTMiP24TZJkothVaHHhuOdAx9Dihn0jFOScWng=;
 b=F6j+3v6PpFxfeFaUEKFsaqSVijD/eAh9igPMNaUm+geiCLMfyXBcKXsihK4xGP8wE2
 kzwxZ/8Rc6suZpEyMFvjt0KKUeUIO8siDHWyUeWzPGassmIu7K5i3ARMS1GdGXuXWyxK
 J6NIE3V5Zfgo7SvfTnitLQzgZ4w4KlOuJ4YgPzTJZGX/gFsJY2IpdpNiM4ed5O1d8lRK
 I8noSUPaK2V+ni153sdlMQmKgDy+RD4dCwYjpf1kz/6bKoDRu1cF29JMmJXZAW7q3gtu
 rNg1EuohaivOHR5kZzC+95Mre0QecSbFIfVLfaXFAu8L2sMZLiM0CgIutRiZ/yoSgcRV
 1wWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782100691; x=1782705491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M6zxMMTMiP24TZJkothVaHHhuOdAx9Dihn0jFOScWng=;
 b=UVJxFdE8asfa6MqPSeLJWfRIM+8/2xbfm+zFPt7I1XKfN5D996vkDMxgLurL0Q8wIr
 aEnjp/8ymceVSc5dMYuYZ+MCWSEcGO3J+qcRopg+SAsKXohKqLtcg3f6h5NWbqQO97yZ
 Vj4DEquHCRgQt8p7ZFg9RWPecOBW/6M0iULd4wK8ELyVEXN3HoMka/vXlndR3mZ8fLK1
 xV19ioPRVD63QlnZ5UM0z2yoTsjoA7k0QHJGxIbnyU8sji7g5kiOQl478aq4rgeUZays
 cwhGm+Vz+ddWqRlV6JuvzKCfVjwpnX509Rm7Ut/kBNyW7YHm4pcE/x1DSC6k0U6A0TRp
 fPKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8L0CJym0LHPZt9YyVATxex0/cIpeOzwTI/3+daNbtsJvGdDzaoO9buijasy5PtLz+klQlJ5EX8wtNw@nongnu.org
X-Gm-Message-State: AOJu0YyuVMH1GUmK02Y96aEdIajvE/0xIlkFdR9XaHZV1+A/rGR3LM8I
 HG6wEQl0vZSKbqZin8GVbeLEeNGTP7y9+3mB/y78EO5qYmcWKNJotKZasafwxmId0bq0b3EWrTn
 kE9BFl3rI+lXXSKhZ/SJUh3yL2XXTRvE=
X-Gm-Gg: AfdE7clgyUTH1Rr+pS69c8MJVB/qEEWlklSWlMpdHuoLhtR3rGD7npUXj9/8/hsb0FN
 F1Ib3Dd2NB9N9f1ELEp6a/QXkXRau8FHRKEGv0sf0ZMj3YjjRWXtUBYgHauw92QSET5zBeXIwur
 GAu7Bxfm8ImYWqu0D31cHjE9am49inA9sQnp/oz7X4jugJucRvOF9zY90341UOwue+VJwX7Zz12
 maoXiqvbL1YAcRpCjXiN3Il5wRDyAzhOatuzlJRmwWJsuBRfJikIeCnuzVFcrvVWvTRnn1h0Z4+
 rs+6aY4Lg2oAENd8gMy03IOaET8=
X-Received: by 2002:a05:6402:158e:b0:696:76d2:eee5 with SMTP id
 4fb4d7f45d1cf-69775e95a2fmr3242871a12.15.1782100690680; Sun, 21 Jun 2026
 20:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
 <20260615131925.3019370-3-qingwei.hu@bytedance.com>
In-Reply-To: <20260615131925.3019370-3-qingwei.hu@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:57:44 +1000
X-Gm-Features: AVVi8CexJLtdyMsdyw25GQkF_lf8IsaMCYbwmy3yStv75bEHKFOL-oWJNd96YEs
Message-ID: <CAKmqyKOiRR5XT_DE4Tx2XGhZLZZMEqWfnEoEc8HRYtNzp+3O5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: riscv_imsic: Skip reset for KVM irqchip
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jim.shu@sifive.com, nutty.liu@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
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
> The emulated IMSIC state arrays are only allocated when QEMU handles
> the interrupt controller state itself. With KVM AIA/APLIC-IMSIC, the
> interrupt controller state is owned by the KVM in-kernel irqchip, so
> these emulated state arrays are not allocated.
>
> The IMSIC reset handler still clears those arrays unconditionally. This
> makes qemu_system_reset(), which runs during machine creation,
> dereference NULL pointers with -machine virt,aia=3Daplic-imsic and KVM.
>
> Skip the emulated IMSIC reset path when the interrupt controller is
> handled by KVM. The emulated path is unchanged for TCG and for
> configurations that use QEMU emulation.
>
> Fixes: 766391483b ("hw/intc: riscv_imsic: Add reset API to IMSIC")
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_imsic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index ac59496c22..f1f23c3a3e 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -347,6 +347,10 @@ static void riscv_imsic_reset_enter(Object *obj, Res=
etType type)
>      RISCVIMSICState *imsic =3D RISCV_IMSIC(obj);
>      int i;
>
> +    if (kvm_irqchip_in_kernel()) {
> +        return;
> +    }
> +
>      memset(imsic->eidelivery, 0, sizeof(uint32_t) * imsic->num_pages);
>      memset(imsic->eithreshold, 0, sizeof(uint32_t) * imsic->num_pages);
>
> --
> 2.47.3
>
>

