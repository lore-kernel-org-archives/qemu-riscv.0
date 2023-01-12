Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG0b5-0002z2-Ph
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 11:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0b3-0002yl-JQ
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:38:33 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0b1-0008HP-JJ
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:38:33 -0500
Received: by mail-pf1-x434.google.com with SMTP id x4so10055446pfj.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EGkQVNtaoQAMvDYuqtGmbHuLfJzMrrI3jFxmiv6ma8=;
 b=fgTdwLU8V54u7Oc1oIcH+DsG5YZSfXWsm1fbnJDjWJ/g3OoArdXyptgi9Hs0VS5Ht3
 N4/kW4NCJ5O6F3aoW2vpkf/hEuTYoHebeC64zvPzU/YY3MK6eUaHhkmafsD91lUEijT8
 ok9kpMIt7ZyY5mri2f28yeVE0HKnOB5X0sWUzgFzE7cy40H2hDWyCmcgRez9gpKmqAe2
 gogZtJtlKQzhTvpsKlFd3zdufklSO90+m+tV1hi5htJNQ2D6V/O+4bKDk03J/usaS/j5
 4knVMfVoTOMNrg0HpPosMXbfZlloblpOymu2nkBbcuj18lAnDZgM3Gd7Ci+cJZNoODZz
 Ft0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EGkQVNtaoQAMvDYuqtGmbHuLfJzMrrI3jFxmiv6ma8=;
 b=hSNRhNeSmdzaN5HrFhKJfbzZk3g4MBSe4oPrQoOh1qD7EmVEYF709MyhAaIY4OONcv
 uEyQ65l8UgVKbq6qUlerUr6tF+ZJ6lm1PJpGzc4zhhV3mc3nzlkHG1ZA2uGPiDW7RWLW
 Ju7vx7bW734x+TyCorjVQukPzF1MzeTcQoh7QauOGS0j/Ze/0AwWUePNQ9P4rHqK1k7s
 X0L1FWsj6tPVe3MX5EpNMeWFSeR04JXG1yNKul6Dh3735Ni5HPA5BBNgu1rfotl4flWH
 umlwAGXeApU5PoTptCeqCZbLM3q3bLYlSmre8NuA7vrQjwozNRveOc2sdL0CaE5rY8/k
 DvDA==
X-Gm-Message-State: AFqh2kr850r/6/Tm7fFp4hXppfVwwxqvcVspd76UsGcE/mbblsmE2/8L
 gpVgi6BOdwezFBSbQHpgn1qIN8oo6viokilkB7pNjg==
X-Google-Smtp-Source: AMrXdXuuxq2fNigpEKi8gb0ubH8uILQj605ArM46se1dHWc8JKUsHhSBsoBcrlQg44JDJsd1n7eca/SnonAZKVV2naw=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr5040754pgh.105.1673541509513; Thu, 12
 Jan 2023 08:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org> <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
 <Y8AwXG/c+IRyJ2U6@redhat.com>
 <CAFEAcA_EP2_0vm8r=12DBTG4a7X7aMYAy2x+K7YctZmSZWTv2g@mail.gmail.com>
 <Y8A1nNp/JieSDgIP@redhat.com>
In-Reply-To: <Y8A1nNp/JieSDgIP@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 16:38:18 +0000
Message-ID: <CAFEAcA84s_nDuni6Z7FzX0EnJT56dtaDHiq1qu0mCUq2=Gg1wg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 imp@bsdimp.com, kevans@freebsd.org, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org, 
 philmd@linaro.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 12 Jan 2023 16:38:33 -0000

On Thu, 12 Jan 2023 at 16:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jan 12, 2023 at 04:20:36PM +0000, Peter Maydell wrote:
> > On Thu, 12 Jan 2023 at 16:08, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > I think the challenge is that osdep.h is too big as it exists
> > > today. The stuff the needs to come before system headers is
> > > actually little more than config-host.h and a few #defines
> > > most of which are specific to windows. If those critical
> > > #defines went into config-host.h, then we could have a rule
> > > 'config-host.h' must be included in all .c files as the first
> > > thing.
> >
> > This doesn't seem much different to the rules we have today,
> > except you've renamed osdep.h to config-host.h...
>
> If the QEMU header files all contain #includes for the
> system headers they rely on, then when tools are validating
> code in the header, they can stand a better chance of being
> able to resolve all the types. Though it'll still fail if
> some of the system header pieces only get exposed as a result
> of config-host.h macros, but that's relatively few, compared
> to today where amost nothing resolves if yuo validate the
> headers files in isolation.

Yeah, but I don't want QEMU header files to contain
lots of includes for system header files, because of...

> > There are some complicated things in there, not always
> > limited to Windows. Also where there is some header
> > that needs a platform-specific workaround I prefer that
> > that header is pulled in by osdep.h. This avoids the
> > failure mode of "developer working on Linux directly
> > includes some-system-header.h; works fine on their machine,
> > but doesn't work on oddball-platform where the header
> > needs a workaround". (For instance, handling "sys/mman.h
> > on this system doesn't define MAP_ANONYMOUS", or the
> > backcompat stuff in glib-compat.h.)

...this. So we'd have to have config-host.h include all
the system headers we're working around anyway.

-- PMM

