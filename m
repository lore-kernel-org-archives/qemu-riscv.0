Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD4CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:06:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbVvC-0001h8-22; Mon, 22 Jun 2026 00:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVtg-0001H0-4M
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:04:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVte-0007S9-Kb
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:04:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6978f1eebb2so1341180a12.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782101069; cv=none;
 d=google.com; s=arc-20240605;
 b=GQBbJapUosutFZV6Fb3Sz8xzI8rOsrPKMM78lDblldiPWKosp+51BlQDS0ET192fxX
 0mK7ud8tOgzmnC4xbqyNGoQz8ugj/NZMrdqS6uYat4Owjc/D/hD7b5YIyA6BJ0zbekC5
 X0+tdshB25lVv4qRaFNdx4UPtHK2LLg+UU2ZMo5qcvND28UKJ6J+Tn3Ve5vXULK2IKUK
 pUcXghRSvw19Kh6qm6u9WWYCJLciPxU7W0BSl4DLwm8hK/p+KydBHGQ1Fi2nVuz6hxag
 xPrQIWKubs1b1Q1o2PbqgTlyhzfKJG8rfdX9jNYj5lR5+5XKLUWtdNCLuspj5u0nx1In
 keGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oggZJT1bpcXZsBglb45WvKyThfsWwP54jRy7SzY3AoQ=;
 fh=vWSGWo6OLS2BrhChafVElCdzonVijQ2lxjiw32h5Gjo=;
 b=fyd7ayEHzMZwJxL26jBzgeUb4/D2ArVKEzRMVPXY64sfWv7pY+cgMxyyPMGmtyQOen
 1GnD9/MdLYTUmqEunjSubv18YARiN+aFTyWSEC0+dzQ/j/d3/uWuHpKYC3Wf711wMh2G
 rKNndMgEc2wjyMv1Ctp3ChkO/POaXdw0tJ968xICjEodiKc8nn/kCqa1O/Vynk9jFO42
 mCdei0g+qV2RUsV1c6QJCzQLDlYt8UTTAdmmENmey4g1kZ1CuLI1emvQd4DoA5O3PpCP
 RJW39SGxBQ4BbY2S4yPJYorkPzVBHvQntK6VrubbJMsvzKGmdxCpB/uUogAy+UvVt7BG
 GxIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782101069; x=1782705869; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oggZJT1bpcXZsBglb45WvKyThfsWwP54jRy7SzY3AoQ=;
 b=CDbIEhkyzEf2plk2yn0lbgAneAc0fDe0zT5f9FInZhpCRMTyyIvqktGfHMgu7JpMxb
 3IjuN6i/Ay5ei+qbH63PWn1tR3i9rqMTWnPqGJ2mHtdjK3UIOpLOqULHLGFgMR9kl1X3
 5BP60wQAfuWX4wl4nq18Xm4i0+OSyvlqAi5pb7NxTb7p0HmByv4K9KpfG8iOMXCvytDl
 iECwRCbvkuYqUBLd7M8z3OEDdtbsnuKCRurjuhHthf7BiOGroPgYgijZHu0JuWN8MzN+
 zEy/gvwWzEe8xg6EToLVhN+3jPDFSf6l7lL3d8mG9I90SRKu/uOv4JsHZ27cME8r/CMY
 zQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782101069; x=1782705869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oggZJT1bpcXZsBglb45WvKyThfsWwP54jRy7SzY3AoQ=;
 b=Kn5bUyymtUZ4VAUGsy8lhT/GWlVOfY/558wLv0Gn335dQ0kdF6xZ6oqs4H8/snp2oq
 mDq/3N41k3EikI2XzCOnaAArE0T3T4oPpxbwjftfXk+ifw2TwiGDbNggsBb1x1/bGd8q
 4srEfcz8znJA3WNCgj2r0XytkfZ1rkpXR26PpjKfUhfA+sHdWPhNFGQrPfNY/24dhWur
 6f9DW0eTI24GWQz09bwBVt0RYxwe0NDgAidN+zWO3UezF+c09fprUOo1yRFudJbGtHlT
 VrvMs0UZ0QunfgFGx3z/tfzolrsQ7f+WQIRhVn6mkaZ6iPTtAHRAnGA+NFJmBMMIg6UC
 5TKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OcE9baSwUoE/p6ADvgVS7OM4xQ4O1oFW31tYooh1DcPMaLisUYgm8WZ8P9p2vpJuSWC2SQzLwDwn6@nongnu.org
X-Gm-Message-State: AOJu0YxtlwRbvVlFSSZuIOw99aF4zv9ckX3qh7eClFz6gwpZzy5wK2FA
 AVqjCuUUlle7qMa8pefsLiYmmuisPCSytFdbbw+9yDVWlguyRRFFMkMN4QuHmDLgrz4EnC9giYi
 KJ/6jMw9pzvRtTjGo11o4YaJ0mj725dI=
X-Gm-Gg: AfdE7cmfR23QUbANAQYfmto9noMHWsQe+J4WjuEWQVz0kdiyTS8oskYGeNWsSPk9Cyq
 SNoHJ06YePo3hZRxChM9WI5zIp5TDaZDFQyt0EA51iSZlF8A31qbgo5XjU00UbNNNS0nH0QGczn
 bgkcl60DJU4ROGE5mllMA5uglOmX76irRBlCKGxMurmHjbbK0XCUOvD2kP92DChIgLf2YCEsrJr
 LsHJETQqWhcpsFdtE7YjYZ+6bpajayar2p2qZtOW1dQdrlM7o8mmV/m7Y4n0ZcJBV+ZShWplC/M
 EeB/Y4fe4fZeI4IQsbuwsZ/0+a8=
X-Received: by 2002:a05:6402:5248:b0:697:7027:4ee2 with SMTP id
 4fb4d7f45d1cf-69770274fa6mr3810692a12.17.1782101068825; Sun, 21 Jun 2026
 21:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 14:04:02 +1000
X-Gm-Features: AVVi8Cdr5gHWclcXUOchlLuwzSsoBI_xwz1-hfLdusLkisP0E7ZUuZFA_OAyYlc
Message-ID: <CAKmqyKM0KjuFQbWE7n4dGPdbaUdaHec+D=tVX4pHsOZXZBjqcg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/intc: Skip reset for KVM irqchip
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jim.shu@sifive.com, nutty.liu@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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
> This series fixes NULL pointer dereferences in the RISC-V APLIC and
> IMSIC reset paths when the interrupt controller is handled by the KVM
> in-kernel irqchip.
>
> Changes in v2:
> - Split the APLIC and IMSIC reset fixes into separate patches.
> - Carry Nutty Liu's Reviewed-by tag from v1.
>
> Qingwei Hu (2):
>   hw/intc: riscv_aplic: Skip reset for KVM irqchip
>   hw/intc: riscv_imsic: Skip reset for KVM irqchip

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/riscv_aplic.c | 4 ++++
>  hw/intc/riscv_imsic.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> --
> 2.47.3
>
>

