Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85E7EE57DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfc2e-0006N2-Aj; Mon, 11 Sep 2023 04:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qfc2a-0006M9-Rg
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qfc2W-0004G3-Fk
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694419978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsHWrNckmvuxYzJuv40/tZiLlF4O17hXUjDTeBE9OJw=;
 b=WJHpJMbYKu72ULID3MM7uKQ3qkHt1M362K3jqAHR/v3uxUHnnqvmYLbRuseP+DvQ1bfgfW
 lkGvSkIsNfUqO5KrpgiFxOE+nSC0rOESTz0zm7PC4osrLYO6NR+VZtXz/p2kV14enMlgZH
 x23/CcKTGwW2a79OgPTc4VrUQgPLtaA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-97nZZN1uO02lETRgOvCjtw-1; Mon, 11 Sep 2023 04:12:56 -0400
X-MC-Unique: 97nZZN1uO02lETRgOvCjtw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9aa05c1934aso300221266b.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 01:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694419975; x=1695024775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsHWrNckmvuxYzJuv40/tZiLlF4O17hXUjDTeBE9OJw=;
 b=qhJzhBf9Yc3vkrkDikt6bCxrId/IoQwKMoUZ/SN6yNpcwxTK8hQIaykBetFNCZKOv0
 qEmzZfHY6jKhInSyIhvGD5JTq2K9WOORmNpE7KF7EGrhisTJ/4e3SPY6Q2ZvEniNKWlo
 QhScv9XSN6XapYvfB2+XPLQD6C99KRCmBUWe20pEj6NfzQf0SHCe76O1ftYjAVs248pQ
 VCLKRqg90Z7GjQGbYvJrv/F5UHyxATIr15tKko/cFLyDHL/dfHmZgpOnwxGs5A/Yxsok
 z/2JFJjFYG5eZUuifgRgy1BlzAUUWGlY1eqVnpWVYSpIsEHAIpD35ieAFZfoe7jZIt8W
 SlEw==
X-Gm-Message-State: AOJu0Yxf3FHbuXbjEGnhQaVbtChWfn0pgiOnEmqOX/hsh7JhrdW9DMTV
 H6cL0vpNUDl3P0KBfI/Cw2DxsxkRCZ5ZUr0bLJMpWWGCt2E6WhGazEdeRBejauBuB3JSyvY0Pq6
 xJqo626sIE1eFmDdOxCyrNTFJ+yonmq8=
X-Received: by 2002:a17:907:d91:b0:9a4:11a3:c32b with SMTP id
 go17-20020a1709070d9100b009a411a3c32bmr15513656ejc.29.1694419975576; 
 Mon, 11 Sep 2023 01:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcazI3wi/dfxP/gKJd5AyTwJZnlefDSh1MZgJnm7hjPig2UOGZ1ssq0ztqttZm1UwV3Q9vVENy3MV4DFayssw=
X-Received: by 2002:a17:907:d91:b0:9a4:11a3:c32b with SMTP id
 go17-20020a1709070d9100b009a411a3c32bmr15513618ejc.29.1694419975239; Mon, 11
 Sep 2023 01:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
 <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
 <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
In-Reply-To: <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 11 Sep 2023 12:12:43 +0400
Message-ID: <CAMxuvawd9Zzq8tpqBNv4ft8R1QvYOvQaVmSB_ZeBgr+O5=M=9Q@mail.gmail.com>
Subject: Re: riscv64 virt board crash upon startup
To: Laszlo Ersek <lersek@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, "Warkentin,
 Andrei" <andrei.warkentin@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi

On Fri, Sep 8, 2023 at 3:47=E2=80=AFAM Laszlo Ersek <lersek@redhat.com> wro=
te:
>
> Question for Gerd below:
>
> On 9/7/23 14:29, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/9/23 13:25, Laszlo Ersek wrote:
> >> This is with QEMU v8.1.0-391-gc152379422a2.
> >>
> >> I use the command line from (scroll to the bottom):
> >>
> >>    https://github.com/tianocore/edk2/commit/49f06b664018
> >>
> >> (with "-full-screen" removed).
> >>
> >> The crash is as follows:
> >>
> >>    Unexpected error in object_property_find_err() at
> >> ../../src/upstream/qemu/qom/object.c:1314:
> >>    qemu: Property 'qemu-fixed-text-console.device' not found
> >>    Aborted (core dumped)
> >
> > Cc'ing Marc-Andr=C3=A9 for commit b208f745a8
> > ("ui/console: introduce different console objects")
>
[...]
> Gerd, here's the question for you: why are "device" and "head" QOM proper=
ties in the first place? What are they needed for?
>

You get QOM tree introspection (ex: (qemu) qom-get
/backend/console[0]/device type). Other than that, I don't think it
brings anything else.

> I've found the following two commits:
> - aa2beaa1f57c ("console: add device link to QemuConsoles", 2013-04-25)
> - 5643706a0950 ("console: add head to index to qemu consoles.", 2014-03-0=
5)
>
> But I don't understand *how* having a "link" helps for figuring out which=
 qemu console displays which device.
>
>


