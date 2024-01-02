Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1CFC46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 21:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKmRy-0004Il-BW; Tue, 02 Jan 2024 16:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1rKmRt-0004Gu-C4; Tue, 02 Jan 2024 16:37:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1rKmRq-0006eO-Ia; Tue, 02 Jan 2024 16:37:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so47723995e9.0; 
 Tue, 02 Jan 2024 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704231435; x=1704836235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
 b=WpKgwuIYS5kJ/C0W5HWw3U8W8XaMt5pX1suWta+U0uNusKVRcGrQ5JkfKnM+i8TFlz
 m3riJ+Qm+kB+n9w/GTlWsqUKezkiMffxqGSVuz6bN6NASmf/TbpVYvA1/1NZb9CHK94z
 kVaDlg7pQCDukCq8bJSWE8xMC5veE2WO4+18IYKEVWitbvkPfMP429WrYBV01tDIC1gi
 XCnEMZ0FfXZ2I09IXhrMtVH3b67ruR6nYZp9yCfbao9W5YMQngzItY1xYiRGXVTOm21W
 D9Y1gZqgAPCXWaOUPuZXdGzFjN31RrD4PEJCUNbOEdhFPYSLvAy0NZUDWERB/zgkD58f
 lznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704231435; x=1704836235;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
 b=J7ZIXovTir9xZhr94bTLKbC5guVPgJL5R0sflRboIalWPp38CoLyiqh919lnr204Jd
 6LdUzM3gOUhYfiEwFGGOcptmVPMPBG9PGNbALJwUcxep4UDCJaPosKwjL90123EYCEWf
 rwAU55tpmn4YyaBIFNyoRA6Yt3xujbNPhlSasqLAX/pXXpHM/DZMhPCH/D+SIq7FK2Wf
 wx/OPguXzf0yHy33+pndAhhtIi9PWHtG56Xxn+LKJ2dq+Ra9vUfW11DTPRAphmPJgMia
 K2jzWYc3rIXUX5Ud9sobFoXvhjSdB7Cliztj/Ms/FQULtvfE7hwlzQuIUOkgLLTl/zVo
 qdfg==
X-Gm-Message-State: AOJu0YzdHhT4kZocPTtn8tSBq9FXpWmOxFTUTWewNJagN5cPksRNz0Gc
 BfmkG83mLm4B2lsfqMJPakA=
X-Google-Smtp-Source: AGHT+IFrz+8G4XaufDC1u0mAfvhOGqc3F19J3DroZasFggdJGsufr8PGV5ZiaTqLN5DOoVoj9N8dAg==
X-Received: by 2002:a7b:ce13:0:b0:40d:6f34:5c13 with SMTP id
 m19-20020a7bce13000000b0040d6f345c13mr2971570wmc.231.1704231434891; 
 Tue, 02 Jan 2024 13:37:14 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-091-072.89.14.pool.telefonica.de.
 [89.14.91.72]) by smtp.gmail.com with ESMTPSA id
 p34-20020a05600c1da200b0040d8b4ebd55sm252596wms.0.2024.01.02.13.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 13:37:14 -0800 (PST)
Date: Tue, 02 Jan 2024 21:37:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander Graf <agraf@csgraf.de>, Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Stafford Horne <shorne@gmail.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Eric Blake <eblake@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Halil Pasic <pasic@linux.ibm.com>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_system/cpus=3A_rename_?=
 =?US-ASCII?Q?qemu=5Fmutex=5Flock=5Fiothread=28=29_to_bql=5Flock=28=29?=
In-Reply-To: <20231212153905.631119-2-stefanha@redhat.com>
References: <20231212153905.631119-1-stefanha@redhat.com>
 <20231212153905.631119-2-stefanha@redhat.com>
Message-ID: <CFD7EE4A-D216-4CE8-B963-0CCEEA623E53@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 12=2E Dezember 2023 15:39:00 UTC schrieb Stefan Hajnoczi <stefanha@redh=
at=2Ecom>:
>The Big QEMU Lock (BQL) has many names and they are confusing=2E The
>actual QemuMutex variable is called qemu_global_mutex but it's commonly
>referred to as the BQL in discussions and some code comments=2E The
>locking APIs, however, are called qemu_mutex_lock_iothread() and
>qemu_mutex_unlock_iothread()=2E
>
>The "iothread" name is historic and comes from when the main thread was
>split into into KVM vcpu threads and the "iothread" (now called the main

Duplicate "into" here=2E

>loop thread)=2E I have contributed to the confusion myself by introducing
>a separate --object iothread, a separate concept unrelated to the BQL=2E
>
>The "iothread" name is no longer appropriate for the BQL=2E Rename the
>locking APIs to:
>- void bql_lock(void)
>- void bql_unlock(void)
>- bool bql_locked(void)
>
>There are more APIs with "iothread" in their names=2E Subsequent patches
>will rename them=2E There are also comments and documentation that will b=
e
>updated in later patches=2E
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat=2Ecom>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>Acked-by: Fabiano Rosas <farosas@suse=2Ede>
>Acked-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Reviewed-by: C=C3=A9dric Le Goater <clg@kaod=2Eorg>
>Acked-by: Peter Xu <peterx@redhat=2Ecom>
>Acked-by: Eric Farman <farman@linux=2Eibm=2Ecom>
>Reviewed-by: Harsh Prateek Bora <harshpb@linux=2Eibm=2Ecom>

