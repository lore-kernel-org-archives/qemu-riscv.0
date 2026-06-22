Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B5CDB46B
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbWO7-0007rD-Ed; Mon, 22 Jun 2026 00:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWO5-0007qR-7m
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:35:57 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWO3-0003rk-N9
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:35:56 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6974ef0c3b1so3552483a12.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782102953; cv=none;
 d=google.com; s=arc-20240605;
 b=cCSQxOFx3nK5XKr+sQ3Hyd57LQuBlU5gTKo1GFNjwPLpbCaATwKXhYsO4mODCSdc16
 1cwP0qZ9mLpICWAhTsX4g6HvZT65TCw8THwtGQBGOqKqCMySbDL08yScFdGFrqHw3efz
 ZKNWXOUzCtphKlTtXm6AlJNEIvf2vniQrnb1aKGCV7NEm+WklslYiPZ9kfvTUDtJeLpk
 5C1FZUEKMzWKgxHDatrcYODTiOIx4V4reCGUSctbjRDlAsVmlN2Dy201511bcL/QEgOR
 N642hoyOMFWNhauQKTRrtx6J6djTcD0xDDDw3siC9EnpqQOMQuajUhSCLuaIgBxONlmW
 EObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pcdmf7LZetcceItTLhB66mO0xEoFX0nY9YjUGjjs+C0=;
 fh=wPp4dQRPpMSxIO9soe1frvR3OpHPCN4amXXereL/J3k=;
 b=RKFYrBPnwZuzPdBwR/RqdbJcjTPZVUSbJTkmx0JoM6PLL2a9yjceQnW/m7yooBg4pi
 t8rXZIMiGeMqj6fGjNGJ937NMkSq/2NUszhvjrb0PdL/ocoJa7liTpmv0AKlC2q5TLB3
 Fc5O6LLGTcYCuZMW7S7fAUiThYkIWhPB8QVQFnUFd1+gJCxnUl5W/+VtLuH4Yy/Gqhy9
 6GB5u5jVjkquFfOXz6buPWqBgI2GDFKF+Y9GqQYTMBPm1mEIoFexGVKA2+AGruCpZjSb
 iy70yO+/dRzxJaSntey+ql0D4tDI+7N2zblE4lV+JpQWNuohGc31JUIha6QXgWVOQNLT
 sVHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782102953; x=1782707753; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcdmf7LZetcceItTLhB66mO0xEoFX0nY9YjUGjjs+C0=;
 b=nNXWeiZnKx3gTAKvmD4Rr3FopLRTItVAOAZ2eGS2xsgNzlUjox9gQJrkOTQe8uJtBD
 Uoq1f0WFJnn6dUsRtpN+EHmtNAPV5zzsc5xJtW3sjuyibWrBQOVGS9eaGGZl9NJ5oo1f
 +0Aj51e9U3RUbVh3dF4aEgIS2y3xYzXjyoUWwAnOlbxqujhySGMwOKe+SKLJul+jPkgk
 jPIkA3ecW31LqEtv0hpHuqE3sP4AI/T1/PXzoZ/k+AAVuh7WkaUwqua/wrz3BTohug+t
 +349JQj7KpAu5MtG+BckTv9ouMLiRB99yrSf/l7vEk/BL7nRRrg1L9iGNHsN9QLcvmNM
 Fj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782102953; x=1782707753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pcdmf7LZetcceItTLhB66mO0xEoFX0nY9YjUGjjs+C0=;
 b=RdxrhMPE4fI+aegzrxlfnrIi/Xwo7NSZAD2f//SWHemFd7vEwreblOEJ0UMQkVcYGD
 nOWap4tRSube0/sX3O39o/q1HTkm+/7SlzaYzNOl70NsN5V28iAe4u0Em3fEXtrR15Cg
 PuEawe4r1nw+KNp2XMZfaieMWreBw3zGxS6buttX1fhB3Xsm5Dy0aYuMahHDMXu+ANzn
 uX+9I2//ATvtn27F3zJHb4cOPehUUuZAf0rjHtoWprFscMz7DXBUBZ2ivTnE8On9yvy5
 dwRMMg+XNereI5ER+l+faWQRpEMX4rgdoaTZ8NZWWfwBfyDIdvRrPzh0tRx0GBhG30Qz
 u7JQ==
X-Gm-Message-State: AOJu0YyzN54wOw0XldsgpPMkO5YK92fyYbklwTCEhxTFlDcQGoYs07KT
 gGzSKyX2f53ybyeDsTda8Jc353jYRO4ayKa6cuwen7LzBDrg9GOtv8o7tzO2tzUStyl0C68Y9/u
 OnJjpxPvWYtF3rApzAOqw5P/LzEmHAMWq4NfZOmA=
X-Gm-Gg: AfdE7cn7D8txyT5fJJx/DQF8g7m+g2Rhdbe5LfDgDPMFmvdAa1kaT6QdaPWlf2Ueg5w
 oy1jX1RWvxsnz9L9wkTBtF/DvB5JvxtjboQV9GLqWLegcJPtN+Ksw/qmACUUI6hEp1MZjr4sJxv
 5fCyQbYr6FtoK9pH6Mx89b2LWIRO9mFcuHekKng1RFihykJZUdUTNPisbkX94eGzkqDNqN0D/mF
 froqxXcJEg1jRZiOkdx7SmLoA5+zj3kv2XwEmY7fppfI2MdcOSx7FHkFDl8To/045BmysCTgUO6
 tGahV8Xl8FZbytdK4t2J+moDsRI=
X-Received: by 2002:a05:6402:358e:b0:697:ad7f:58dc with SMTP id
 4fb4d7f45d1cf-697ad7f5a8cmr1075688a12.17.1782102953251; Sun, 21 Jun 2026
 21:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102118.2768383-1-mengzhuo@iscas.ac.cn>
In-Reply-To: <20260518102118.2768383-1-mengzhuo@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 14:35:27 +1000
X-Gm-Features: AVVi8CfFe5rBGLDqM6tAIUlgXiFP9oO4K7wzOeuNit-DLLZHtAW7wJHchodUw6E
Message-ID: <CAKmqyKMFkg_M1kRVzikZUsinBmU67tg9ie4us4Qdm-cqU1Tj1g@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv/kvm: skip FP/Vector sync on
 KVM_PUT_RUNTIME_STATE
To: Meng Zhuo <mengzhuo@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
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

On Mon, May 18, 2026 at 8:23=E2=80=AFPM Meng Zhuo <mengzhuo@iscas.ac.cn> wr=
ote:
>
> During KVM exit processing (KVM_PUT_RUNTIME_STATE), QEMU never modifies
> FP or Vector registers =E2=80=94 only core GPRs/PC and CSRs are potential=
ly
> changed.  Re-syncing 32 FP and 32 Vector registers on every KVM exit
> wastes 36-68 individual KVM_SET_ONE_REG ioctls per vCPU exit.
>
> Follow the s390x pattern: early return on RUNTIME after syncing core
> registers and CSRs.  KVM_PUT_FULL_STATE and KVM_PUT_RESET_STATE continue
> to sync everything for correctness during migration and initialization.
>
> Signed-off-by: Meng Zhuo <mengzhuo@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index b047ffa9c0..dd4193ea8b 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1385,6 +1385,17 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutSta=
te level, Error **errp)
>          return ret;
>      }
>
> +    /*
> +     * For RUNTIME_STATE, KVM already has the correct FP and Vector stat=
e
> +     * from the preceding KVM_RUN exit. QEMU never modifies these regist=
ers
> +     * during exit handling, so re-syncing is unnecessary.  This saves ~=
68
> +     * KVM_SET_ONE_REG ioctls per vCPU exit.  See also s390x which uses
> +     * the same pattern.
> +     */
> +    if (KVM_PUT_RUNTIME_STATE =3D=3D level) {
> +        return ret;
> +    }
> +
>      ret =3D kvm_riscv_put_regs_fp(cs);
>      if (ret) {
>          return ret;
> @@ -1397,11 +1408,9 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutSta=
te level, Error **errp)
>
>      if (KVM_PUT_RESET_STATE =3D=3D level) {
>          RISCVCPU *cpu =3D RISCV_CPU(cs);
> -        if (cs->cpu_index =3D=3D 0) {
> -            ret =3D kvm_riscv_sync_mpstate_to_kvm(cpu, KVM_MP_STATE_RUNN=
ABLE);
> -        } else {
> -            ret =3D kvm_riscv_sync_mpstate_to_kvm(cpu, KVM_MP_STATE_STOP=
PED);
> -        }
> +        int state =3D cs->cpu_index =3D=3D 0 ? KVM_MP_STATE_RUNNABLE
> +                                       : KVM_MP_STATE_STOPPED;
> +        ret =3D kvm_riscv_sync_mpstate_to_kvm(cpu, state);
>          if (ret) {
>              return ret;
>          }
> --
> 2.47.3
>
>

