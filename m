Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD50C10DC1
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8o5W-00082A-9X; Thu, 30 Nov 2023 15:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r8o5V-000817-Ex
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r8o5T-0002IM-6X
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701377802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CvBa0sQTQ4iydX+WLgMreuODjjAkBlkycz9lfLxb2yo=;
 b=go4JouXgP/qYR0pqbpuiwCswEGdsF9/BFXEkQoDQVk+eFSzVe2FzADGiJXn+w6Cw7B5BQq
 G1U2lRZFN6XBgFG/XtD6WNhsvB1OWchvenC7wnqDIa9FdBKdUpIAsad52JQvXil46gR3hd
 MplBgH/IAzkCjZBbgEthJX/wCTgXT4o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-IArhrRK0PiegH8OM7_N7Fw-1; Thu, 30 Nov 2023 15:56:40 -0500
X-MC-Unique: IArhrRK0PiegH8OM7_N7Fw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-67a1f7b4a0fso3396526d6.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Nov 2023 12:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701377800; x=1701982600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvBa0sQTQ4iydX+WLgMreuODjjAkBlkycz9lfLxb2yo=;
 b=uWEYxos+lJ+wE3WbZTCukVad2iKrovgEZxsA+y9i2e+i09VzGypNyUUZrNQzJ7qmNy
 UjbzAM+3wakqYxLMmWMQ6mW1FxM8BG7cix/wfYkG6/OJt40vgt0a2morJzvFFks8Kas4
 hoEgUH/0obx+jr1JZ76/YdNRGGZarQOaL/FiaHfvz88kDZZJBehLaFNRoABnWaPKCteo
 O8DXpfeACSXM1iJiQDDD64Jd/S0S4YmL2ZQ0TBogsQabtDg4ulSYSz79a6+uYL4vxJbB
 ha9CWYmKRPr+MC9UAjsw/N0vIUyedIlXAU5TA0bOq47veedxdMpKOO8syh2VbarIOq4X
 sqKA==
X-Gm-Message-State: AOJu0YxMIQpArehZ0OHgZTSbjoP9xvTMXXFginXXJW1N5Vfk7DGud1PO
 8C2fXnempcpgVppD5YYHshcW49Lz2oebMxyEslidyMZtZSoxhJn83YoFzOMBT5AM+0I2B1HLxxx
 N+irUiFYbHpr/SCA=
X-Received: by 2002:ad4:5246:0:b0:67a:1c70:115e with SMTP id
 s6-20020ad45246000000b0067a1c70115emr20447938qvq.1.1701377800284; 
 Thu, 30 Nov 2023 12:56:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZFruQQTFBL/xGKczOZd90VtaWOUXKwFyQD2ApNFiLcB8OZlzG0+liCbF3N/eQ9eEuKWmncA==
X-Received: by 2002:ad4:5246:0:b0:67a:1c70:115e with SMTP id
 s6-20020ad45246000000b0067a1c70115emr20447887qvq.1.1701377799939; 
 Thu, 30 Nov 2023 12:56:39 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 y10-20020a0cc54a000000b0067835abc38bsm811386qvi.129.2023.11.30.12.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 12:56:39 -0800 (PST)
Date: Thu, 30 Nov 2023 15:56:32 -0500
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Stafford Horne <shorne@gmail.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leonardo Bras <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <ZWj3AN5qBnEu8NcI@x1n>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <ZWjr0TKxihlpd1jm@x1n> <20231130204325.GE1184658@fedora>
MIME-Version: 1.0
In-Reply-To: <20231130204325.GE1184658@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, Nov 30, 2023 at 03:43:25PM -0500, Stefan Hajnoczi wrote:
> On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
> > On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> > > The Big QEMU Lock (BQL) has many names and they are confusing. The
> > > actual QemuMutex variable is called qemu_global_mutex but it's commonly
> > > referred to as the BQL in discussions and some code comments. The
> > > locking APIs, however, are called qemu_mutex_lock_iothread() and
> > > qemu_mutex_unlock_iothread().
> > > 
> > > The "iothread" name is historic and comes from when the main thread was
> > > split into into KVM vcpu threads and the "iothread" (now called the main
> > > loop thread). I have contributed to the confusion myself by introducing
> > > a separate --object iothread, a separate concept unrelated to the BQL.
> > > 
> > > The "iothread" name is no longer appropriate for the BQL. Rename the
> > > locking APIs to:
> > > - void qemu_bql_lock(void)
> > > - void qemu_bql_unlock(void)
> > > - bool qemu_bql_locked(void)
> > > 
> > > There are more APIs with "iothread" in their names. Subsequent patches
> > > will rename them. There are also comments and documentation that will be
> > > updated in later patches.
> > > 
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Acked-by: Peter Xu <peterx@redhat.com>
> > 
> > Two nickpicks:
> > 
> >   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
> >     rename qemu_bql into bql_?
> 
> Philippe wondered whether the variable name should end with _mutex (or
> _lock is common too), so an alternative might be big_qemu_lock. That's

IMHO mutex isn't important in this context, but an implementation detail of
the "lock" as an abstract concept.

For example, we won't need to rename it again then if the impl changes,
e.g. using pure futex or a rwlock replacement.  When that happens we don't
need to change all call sites again.

(never really meant to change the lock impl, just an example.. :)

KVM actually has that example of KVM_MMU_LOCK() macro taking as the rwlock
write lock when the spinlock is replaced with rwlock, while it'll keep to
be the spinlock "lock()" when !KVM_HAVE_MMU_RWLOCK.

> imperfect because it doesn't start with the usual qemu_ prefix.
> qemu_big_lock is better in that regard but inconsistent with our BQL
> abbreviation.
> 
> I don't like putting an underscore at the end. It's unusual and would
> make me wonder what that means.

Ah, I meant replacing the "qemu_bql_" prefix with "bql_", as that contains
QEMU already, rather than making "_" at the end.  So they'll be bql_lock(),
bql_unlock(), bql_locked().

> 
> Naming is hard, but please discuss and I'm open to change to BQL
> variable's name to whatever we all agree on.

I'm pretty okay with qemu_bql_lock(), etc. too.  I prefer a tiny little bit
on bql_ over qemu_bql_ in this regard, but frankly they're all names good
enough to me.  The "qemu_" prefix can still be a good thing saying "this is
a qemu global function", even if contained inside "bql" itself.

> 
> > 
> >   - Could we keep the full spell of BQL at some places, so people can still
> >     reference it if not familiar?  IIUC most of the BQL helpers will root
> >     back to the major three functions (_lock, _unlock, _locked), perhaps
> >     add a comment of "BQL stands for..." over these three functions as
> >     comment?
> 
> Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
> of these functions.

Thanks!

-- 
Peter Xu


