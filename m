Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78D0C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 14:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rND1u-0005U4-Qw; Tue, 09 Jan 2024 09:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rND1c-0005Gs-GB
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:24:18 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rND1a-0008Cx-Dh
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:24:16 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50ea98440a7so2899178e87.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 06:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704810253; x=1705415053; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/fxIqo+g5WwjavjYufA4hFi1cRbz34uO2PZEzQMCek=;
 b=CQuwigCMYjkwADbs4UKn5pW7quKJgZyhj9oVVnyn+jjGlSv3vzruOtJr5xKa3gbgAy
 lYyhAKllFcuvmQzpEnsC7kAXRxjZ7ainllblfKM4m6wqOxc2NaZIR61Vvx/k3f15QS33
 uDD/WKzb6fKWuUJIaUTyHIJsk0CXSq7HPixEeg8vbem/r5Ewdant5Hws/Ltu2AWYaC+c
 lWzgHwXOnCJ4A27OPdi9zT03NKqDZPYXyN8eUWiVBqIRJIlxMD+t4SVk0wjMFyOf7jID
 2UxdhrMPxTLN+PaVKRtUwN8A0plDoDi4FNMZWCHC9VnLPZmmrE64FdoYMQ23cZhDYeD5
 GEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704810253; x=1705415053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/fxIqo+g5WwjavjYufA4hFi1cRbz34uO2PZEzQMCek=;
 b=T2Ck60xGLL3YNxxFQhMy8F3jtOHl+W542J3uuW0kyrz96e8H9Gp33dAptwbBB83Wkh
 FsyH8lUNBQ7jUzz3DRLtP5grUksyblp8DtenhrfjHLTo9KeooypzhPXQ9C4y/+K9BU8F
 /smvAApHqv5D+KjTp6A27yuBtkuPwbvQWrMnSunLPxf+HDfi4Xa3PRuguWVi0SBoMm+C
 nu2uBwfnIqO06EcN37ihpOkRkYpzjgQo49Km6vGhl1W6N6y9I11Gx1CmZCNkNWJRz64J
 HMrCD0HbLYnCXB6SlzdBeUZkKszzGlSNza5pfiUlLwmdeXpKbqaoaZMA+datyj15RRrC
 m85w==
X-Gm-Message-State: AOJu0YzwaFa2sXOGQ/t5bUrn6BP9qpT+X0OSm5RdwWYlDEvaJNFtddVo
 LaMlE+wtBqRWaLtWqrdK9hFLop3eooWML4lXnGKyD57fyyXOHw==
X-Google-Smtp-Source: AGHT+IFrVXvHsq1m1peP2eO+e72Pz8YdISUp+RIUUAo1aE+Zj9tZO0OThcNuGgpWww0VuL5fmq96NN7TJ2JIvwtuWz4=
X-Received: by 2002:a05:6512:2001:b0:50e:a923:4bb with SMTP id
 a1-20020a056512200100b0050ea92304bbmr1442148lfb.133.1704810252732; Tue, 09
 Jan 2024 06:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20240108163735.254732-1-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2024 14:24:01 +0000
Message-ID: <CAFEAcA_RYdGZRxOAD43phmj0WmHTbU01tiNTmC8CxHF2cpb6DQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 kvm@vger.kernel.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, Jiri Slaby <jslaby@suse.cz>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Paul Durrant <paul@xen.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, 
 Kevin Wolf <kwolf@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-ppc@nongnu.org, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Song Gao <gaosong@loongson.cn>, Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Graf <agraf@csgraf.de>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Hyman Huang <yong.huang@smartx.com>, Michael Roth <michael.roth@amd.com>,
 Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>, 
 Cameron Esfahani <dirty@apple.com>, Eric Farman <farman@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 8 Jan 2024 at 16:37, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit ffd454c67e38cc6df792733ebc5d967eee28ac=
0d:
>
>   Merge tag 'pull-vfio-20240107' of https://github.com/legoater/qemu into=
 staging (2024-01-08 10:28:42 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 0b2675c473f68f13bc5ca1dd1c43ce421542e7b8:
>
>   Rename "QEMU global mutex" to "BQL" in comments and docs (2024-01-08 10=
:45:43 -0500)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   iothread: Remove unused Error** argument in aio_context_set_aio_params
>
> Stefan Hajnoczi (5):
>   system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
>   qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to BQL_LOCK_GUARD
>   qemu/main-loop: rename qemu_cond_wait_iothread() to
>     qemu_cond_wait_bql()
>   Replace "iothread lock" with "BQL" in comments
>   Rename "QEMU global mutex" to "BQL" in comments and docs


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

