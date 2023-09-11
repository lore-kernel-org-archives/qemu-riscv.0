Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF008EE801F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfbwB-0005q1-PU; Mon, 11 Sep 2023 04:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qfbvn-0005gA-VJ
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qfbvk-0002mb-UT
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 04:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694419559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd2YVU46vtGzIOK2gNaPmB7AUSEZaiGpR3JFR0/5X3o=;
 b=U2rKix4qvZd4PgkvjrPr9VmiglLsyMFspFVK32ULViRnxiWydS93cF7JHb3vsMAP1B2HQZ
 xhFLoSjUpq+Hjmxx8LKP4H9WqwI7TQAHxcWLQmmcCtmrL5O8j3I7jJPeHsdyPzPn4EX5xR
 e3Bv6u/Q8oBZod1Ry8JH2o6j/D2IUV8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-2uwGErncMjar3TrKTKSrWw-1; Mon, 11 Sep 2023 04:05:58 -0400
X-MC-Unique: 2uwGErncMjar3TrKTKSrWw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe55c417fcso4265446e87.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 01:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694419556; x=1695024356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fd2YVU46vtGzIOK2gNaPmB7AUSEZaiGpR3JFR0/5X3o=;
 b=vtGQWIYi/bvT9/Bwmeh8gCViejv8f/7Y98pJEYmXfl3Nnrt092YoduBwnwCBS2OXvs
 SLLPE9QD1nX14ioXiLlzVDA+INvyTHlcrPho0eeRUYtIDo3AcHA29CssukRcBqOVQanz
 kN98PonRRl6XJTwEsJbPI8NIKxdmbaB2SGb9eqJBRVP38ponJ9KVFuaHTDI7suHQ043q
 2EXb9a7YCgI/GQfEFcvqvJ3URm/y/6oHedf7/CYEYtkVbW7l+Sl26rslEFfw7xRRLfJM
 CfG5F3nGuKBtXLTzhtvrN7oZF7ncxGkZqDq1FFn49eBJPwxuCEZlUDq/WBpPM8f0Wc3h
 ob1g==
X-Gm-Message-State: AOJu0YzNVJ7HWACh/prhwZ3wQWe6ncPd70tODCNi7zYRga+GptA5AmSX
 8frzqLekpUiybHlDyWgVASdVlFU2QxhhjLOxkahWNP/mrFlnROJW8ZLUvLmz6eo6f3XkAMn7dKj
 5zeNiYYszzEtqCDVtrWMENDbWNXqi6u8=
X-Received: by 2002:ac2:5f66:0:b0:502:9a2c:f766 with SMTP id
 c6-20020ac25f66000000b005029a2cf766mr6340080lfc.30.1694419556694; 
 Mon, 11 Sep 2023 01:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPsuuMNPD0Iv4HLS2M4+kZqVcUr6ndzjeI07mQimYx0/52qFlsoOo9655cliYsTnJ5NWyKxXpQMXCWeO+IL7E=
X-Received: by 2002:ac2:5f66:0:b0:502:9a2c:f766 with SMTP id
 c6-20020ac25f66000000b005029a2cf766mr6340053lfc.30.1694419556375; Mon, 11 Sep
 2023 01:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
 <1398e971-8115-13e1-6ee4-4c46df0814dc@linaro.org>
 <fe0ebb81-30b7-9e60-e9b5-7737c562274b@redhat.com>
 <bfddf3fa-0b14-25b4-39d6-e3f65b659525@redhat.com>
In-Reply-To: <bfddf3fa-0b14-25b4-39d6-e3f65b659525@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 11 Sep 2023 12:05:40 +0400
Message-ID: <CAMxuvazKR3ko8B5zMw70tqwo9hJAZ_wcOrJHqrFQ3c1FGJCsOQ@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Sep 8, 2023 at 3:55=E2=80=AFAM Laszlo Ersek <lersek@redhat.com> wro=
te:
>
> On 9/8/23 01:47, Laszlo Ersek wrote:
>
> > I don't know why qemu_console_is_multihead() used a lot of QOM
> > trickery for this in the first place, but here's what I'd propose as
> > fix -- simply try to locate a QemuGraphicConsole in "consoles" that
> > references the same "device" that *this* QemuGraphicConsole
> > references, but by a different "head" number.
>
> So, the final version of the function would look like:
>
> static bool qemu_graphic_console_is_multihead(QemuGraphicConsole *c)
> {
>     QemuConsole *con;
>
>     QTAILQ_FOREACH(con, &consoles, next) {
>         if (!QEMU_IS_GRAPHIC_CONSOLE(con)) {
>             continue;
>         }
>         QemuGraphicConsole *candidate =3D QEMU_GRAPHIC_CONSOLE(con);
>         if (candidate->device !=3D c->device) {
>             continue;
>         }
>
>         if (candidate->head !=3D c->head) {
>             return true;
>         }
>     }
>     return false;
> }
>

ack, can you send a patch?


