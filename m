Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1242E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 02:38:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpg9X-0001tS-1m; Sun, 08 Oct 2023 22:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpg9U-0001sx-VA; Sun, 08 Oct 2023 22:37:49 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpg9S-0006bH-M0; Sun, 08 Oct 2023 22:37:48 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-45271a44cc4so1503409137.2; 
 Sun, 08 Oct 2023 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696819065; x=1697423865; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWSnrxAX1jcbd863saCRufUkg4bkRHNMDlwK2nigrk0=;
 b=f0d2P8v66GsofajjSMElB/lnSLL8BQ8wTqHsGTfj7soL4mLRQ0g7puaAqHP8DZIOVW
 W0gB4s5+mCITuEIq9p+tt6Pp6iO4b5gPu4Rml6DjonKqUv5BQ3+4XThj7juwtkUmC5u5
 JBOgdxqlXz7tOXMQe0SlS+aYKt5tEYaCsxnlrk4cHMpgAMiU8ILGNDwPOU5OX5ZMxe/O
 s8Y5KCP5B05CeoMFob2fnmqjSOFPVGkTDTVAdhtCj3S45jxK/uM9t1NJVhnsnShSBCpt
 C5+ACyROZqFS5IXvF0WXKD2QIy6/75EhoXNx7GMnWk9UyAMnPjX/qo30hHXyktm8asvY
 vdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696819065; x=1697423865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YWSnrxAX1jcbd863saCRufUkg4bkRHNMDlwK2nigrk0=;
 b=gjfUWBXIpC/D4D6eWtH0mbDlT2FuKf9H82uOS7g682kUzJ+2I88WqcAQe6cmWNH0AB
 E76J02wavAhzZDpkyP2gW5GH+DwwflcSmodOUgF+jJGp0c1eEDHVnN4PYf7EbyPCtP1l
 j/W0837/TtaQXFnV7CmfxY3ZC6Mqoam2cVDacHHG7Jvy2OZ04KoU914KMAZr7jb2/dSw
 LYRMvDixVbYk8mTdF8CmCyLJGtp+Jlu1cCytfBWSVr/Z/Bm6yYDUTW62y6zw1ZIRpCXC
 WJazJXQGFosnM76ndR6spJ7YbQW8mGdFB8nR9Foe4gT7ZKf6TLf2+FLAu1Karvn6bUKp
 8E0Q==
X-Gm-Message-State: AOJu0YwRw634ko1Cm2SIRSaCPl5Z+lMZKeBzm2r6v+XNNN1mpUSIYO2Z
 nEzId3GPqpOW4VpNOC70bKz0KYXu95Koxc4SS5A=
X-Google-Smtp-Source: AGHT+IGy/7x/6FwwwWcjJK9bmNxQYWaOpIkcNm9OFX7WjTsugc2QpAHSNjP78hz+98QZJI38RbgG0bAUe62HIVhPqvU=
X-Received: by 2002:a05:6102:2f6:b0:452:88da:2e1f with SMTP id
 j22-20020a05610202f600b0045288da2e1fmr12919411vsj.21.1696819065151; Sun, 08
 Oct 2023 19:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
 <20230926183109.165878-3-dbarboza@ventanamicro.com>
 <ZRapCe9kGyw52bLS@redhat.com>
In-Reply-To: <ZRapCe9kGyw52bLS@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 12:37:18 +1000
Message-ID: <CAKmqyKO1808GvE89rCDB7aa8P+GD9qAXzonJqsSuNQN4S94Pug@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/tcg-cpu.c: add extension properties for
 all cpus
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Fri, Sep 29, 2023 at 8:39=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Sep 26, 2023 at 03:31:09PM -0300, Daniel Henrique Barboza wrote:
> > At this moment we do not expose extension properties for vendor CPUs
> > because that would allow users to change them via command line. The
> > drawback is that if we were to add an API that shows all CPU properties=
,
> > e.g. qmp-query-cpu-model-expansion, we won't be able to show extensions
> > state of vendor CPUs.
> >
> > We have the required machinery to create extension properties for vendo=
r
> > CPUs while not allowing users to enable extensions. Disabling existing
> > extensions is allowed since it can be useful for debugging.
> >
> > Change the set() callback cpu_set_multi_ext_cfg() to allow enabling
> > extensions only for generic CPUs. In cpu_add_multi_ext_prop() let's not
> > set the default values for the properties if we're not dealing with
> > generic CPUs, otherwise the values set in cpu_init() of vendor CPUs wil=
l
> > be overwritten. And finally, in tcg_cpu_instance_init(), add cpu user
> > properties for all CPUs.
> >
> > For the veyron-v1 CPU, we're now able to disable existing extensions
> > like smstateen:
> >
> > $ ./build/qemu-system-riscv64 --nographic -M virt \
> >     -cpu veyron-v1,smstateen=3Dfalse
> >
> > But setting extensions that the CPU didn't set during cpu_init(), like
> > V, is not allowed:
> >
> > $ ./build/qemu-system-riscv64 --nographic -M virt \
> >     -cpu veyron-v1,v=3Dtrue
> > qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.v=3Dtrue:
> >   'veyron-v1' CPU does not allow enabling extensions
>
> Why should we block the user if they want to enable an extra
> feature, over and above what is built-in to the CPU model ?

It ends up being tricky to maintain. On top of that we can report a
specific vendor CPU to guests, but then we don't correctly model it
(as extensions might be disabled).

Alistair

> Is there some technical reason that prevents this from working ?
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>

