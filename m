Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933DBCD98F6
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:21:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbVDF-0001Hc-Ck; Sun, 21 Jun 2026 23:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVDE-0001HJ-8c
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:20:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbVDC-0003PP-KR
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:20:40 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-69796a9f04bso1297992a12.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782098437; cv=none;
 d=google.com; s=arc-20240605;
 b=kR9+YDHdhd20M1DP6VpeorTOPm/0yZxbLIGm84VIwedJc637WsAXItuYbprbtvFFee
 eyGFdkaUyLojGJuRiQXcxYIapVRiQCR4VNdOMC6rIkUfLlLCiodA+VeJLtfaZ5xL9QPz
 K1xf6imsCquljCFRtKbXGhD5YllP1wG2JDkHR2n+Tkc2aJXHp/u0OdVNYSAu5nn93QTt
 B4QXKLQPfDWSOkK5JuMTsWfoqPTdGdhWt+kDJqMulGbUpFcedD1pPxvw2I+nDBuvZVT5
 2KLfXGcPxMSPXYHoJRepMwtEKlEqu/QqPJLc5tF4anlYaS0GaPxT44PBn39KxQMeeXcR
 kedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8AuNRFLhfIX2YXpQo9uLdUb/os7G5GTJFgOtHgXljWM=;
 fh=hvdadZ4AP/bVhsJGEkGVBet8SXVqxU+CxE+zJbS4Jfk=;
 b=DHN6xxwTbSRNoTRmzwpCc1bQ77/riES9gBMTvI555S/B0L9vTFDLjEQTdYYpMHMjsK
 lMU1vo0HJT+WL46G9uSj8/Ac0lOSNJHfJ5OBJ3+I0zGUlrcL7DRsd8ARnW68XA/wThAY
 RECT7UP5dApzVsh6PEoa2ISc1VJOpU9v27fMuX9S+VxA3hHWKIFAjyOPR9/bQAGfvL7b
 eCOQ+e1gp3/eubpssBRgtDwCz0QDBRoA95XwoR9AoKmk3oR3mXcM694MEzTMYUsC/q49
 Ah3Od1q+p4Qgy+89Wc5WedEK1w5sywO7nGVD5HIHnxJS1RLIU/T7DqiQp+2+IAD9KYMT
 5qog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782098437; x=1782703237; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AuNRFLhfIX2YXpQo9uLdUb/os7G5GTJFgOtHgXljWM=;
 b=nMWoWNklHy8CHP4sifs/Z0HwszV+MQvDhIEOivBlC18mbkDOxbtjs5FAX6rWa0zWmk
 H3ENklPxIreP5n72D+oWpRbMjiJMKY3bItUsbRC4Y0Gm+9AYNhB2mhjoEo2U5JT5NM0z
 Bu1lmGLdb/FZr0v8Wuv29I8rCrMDdNAWDJPMGqZ0xc2SOmFyHuRFRzea7tjsnb0buQtW
 bDLRrpYIgYFSIBs/8eWvIzV3SqEoAHl6fx00Fxw7lRxm9HJAcjeE7LjYIKzCrJ9mDxzV
 5oZD7ZLOEiX0rUuDQr8jBPLlE/5Ko5FSuumuoZbaCoOyqjXd8qYjy9J03/8jYEJpwApv
 sslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782098437; x=1782703237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8AuNRFLhfIX2YXpQo9uLdUb/os7G5GTJFgOtHgXljWM=;
 b=XoKKPTyoWSVlGwGp1nzVdDCjeclWmJKnsC7D7xkCpSyrUdwAaaaAzi0Kjfa2sMRj6X
 IyDDTPfsz9Yt+Nmxed48d/OpvbvYXmX8fjy5nwZVOgtYZ6zobyRZtvsIqZdIQgtxGaqW
 E+PvTAJa03zKEdAwufG9jYvpifZScsRPa+8ZQSVsS3BovQhT76bH0mohnDke5lGTSozm
 nHasXGVPIPGuBT85r5Ix6FIahyjJmv3asJfcOHn/9KfSOvsrQppf61lB4cjma1whVXKn
 cIgbJEkqjDnMmfngUQ1k1dwF7lHqsTGQPhiKfVOrBIjDzOzbOcU8PVV3HOJ+zVv8Ire8
 39SA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9wh74P4EIhyouEoAbnrcSdwAYvu2+MzuRQcfeYTk0sf+8rMlFB8XehFFosdRdWyrvSrmiYxhKyM12U@nongnu.org
X-Gm-Message-State: AOJu0Yz8CrmEYSwJYn6hJMs8iVIArfHyLcDH3wmt8ufUU1FNH1QQllTU
 g+051R5YDzwfDCo8kXsmUpEpTBUWOtOY4wU1AGoYt7iiEgVwwX0qAJxc6oERS3ceDyQMgwpgCTc
 kFVxC4qkKJKLBr1Sr3T7rJTVdwmO7wYk=
X-Gm-Gg: AfdE7cl/x8KHEwuo0mDJlvOHWGHPaKIhD54rkaHhhdBGW4OQyCjS66pMLf5MVtTsPTq
 3deD/nH8IWbuHaVK2NqT7mrBtomJkT2POX9ad9ZuKnEmZ0wlVqQDZ7OaWRisFXoYKVmn9HHyKac
 tRmV4dgcc8DXkfs7yctCLg7df3xDqNRQIUheeL/dgEPxsrUbC6hw/b2lnsLWKPF7Hllqe9fCEyY
 m+iko0hJFHFuGkbS0wEp35zJOaYzxrvA52MwOTtHItRgFGotuN0Ko7KwwHNfD6kFihLJ0XsiZBN
 k+Wy7MwPJiCL6EhOyQD8hR+dylSaRLskxCL6pQ==
X-Received: by 2002:a05:6402:158e:b0:696:76d2:eee5 with SMTP id
 4fb4d7f45d1cf-69775e95a2fmr3206474a12.15.1782098437113; Sun, 21 Jun 2026
 20:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260617063630.111472-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260617063630.111472-1-wang.yechao255@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:20:10 +1000
X-Gm-Features: AVVi8CeWtWFzagpcIawyNvbDvsVTN1nNt6ungAFtC1pwevPeUYqpq2iiy5vNuEg
Message-ID: <CAKmqyKP50HjozugAefA20h_m6Dya40ZiVe5rtiJDV+Z2Tvqsew@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm: add extensions after v7.1-rc4 update
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Wed, Jun 17, 2026 at 4:39=E2=80=AFPM Wang Yechao <wang.yechao255@zte.com=
.cn> wrote:
>
> Expose zilsd, zclsd and zalasr.
>
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>

Can you please rebase this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 53d88339c1..6bebbaf7d4 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -303,10 +303,13 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zihintntl", ext_zihintntl, KVM_RISCV_ISA_EXT_ZIHINTNTL)=
,
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
> +    KVM_EXT_CFG("zilsd", ext_zilsd, KVM_RISCV_ISA_EXT_ZILSD),
>      KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
>      KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
> +    KVM_EXT_CFG("zclsd", ext_zclsd, KVM_RISCV_ISA_EXT_ZCLSD),
>      KVM_EXT_CFG("zabha", ext_zabha, KVM_RISCV_ISA_EXT_ZABHA),
>      KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
> +    KVM_EXT_CFG("zalasr", ext_zalasr, KVM_RISCV_ISA_EXT_ZALASR),
>      KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
>      KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
>      KVM_EXT_CFG("zfbfmin", ext_zfbfmin, KVM_RISCV_ISA_EXT_ZFBFMIN),
> --
> 2.27.0

