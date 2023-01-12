Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG0Jw-0004T2-Aq
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 11:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0Ju-0004Sk-TC
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:20:50 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0Jt-0005fh-6f
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:20:50 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so2562869pjm.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMrjHmCg1A+wNht30Z+xf3kV0pLt6BvLnr7luCC1WM0=;
 b=rl2sQHKDLAVSQ8jPaxCedRR3mM3nhOD5ucNhJN5uZgRgOg63IxOAQqzWbIdFg5hW3L
 cqhXUEUOciKAz/F5ZlUUEtRMcsj6J99q30SmbXbgeLrNT85msn0lcMtp7yYyolzrGOPI
 tyb3CFFxflmsmGfEJoMOFTyL9Y7oKSclMwkPNPT9Ky5QopaFVcjuCDEbw9ThZIrnimqA
 9hKOrdGpxb3tGdaFtLPEAlMCJI5Gd7d9QU0S5Y0O4MqZVkOJeKqoNgIdFGphRlSfWWb9
 aHFmJxDWi7Fkf4TA1jSdaaVkw5uunHaIk6Zqffyhe7C9T1fP3Zm4Vp1W7/KXTQt+ZvS1
 1MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMrjHmCg1A+wNht30Z+xf3kV0pLt6BvLnr7luCC1WM0=;
 b=GxBLbwfpxWYrnoiS9TEf754YmCpXoj5sqyLo3bw+ZvwQXkeBDhHcIPSGEPRqRxBpXr
 T9eWJJ2Zat1yYuKt/dxecse5ivarg62ldwkflakqA4qe+C2dkL2pUPu8y49zgrfBH90G
 eJOmPrbQQ9O3+xFNuS6lwA3A5yuB7G6y/KgAKI3slf3lvRJtcc8XgoVCAkCcfC5Hw+xx
 mOxNabZEPRjR+Z4TDji60YkUdT5+IjuDxaXxW5mEH/1a0kKS87fHRwI/UATsuG8lRaGJ
 PMWhyT2y5hLk0I7D0AAosrW6PHx+ojQQQmXFfpketXMYBtx/Y8tvalIqo1HmsjpiaLR5
 uUDg==
X-Gm-Message-State: AFqh2krpEWZrLoGUAbRVzvNZB4dZtWuPsJoLeBonhd71AkxrcK+RCUXl
 JJmeSbITD9Ubn52QGoH/Q7z+F1Wcj7oDSMZwcydTpw==
X-Google-Smtp-Source: AMrXdXvdlVP/tfer2Id1Kqud5iB98fK3P+6OrG6Vwvl57a3z4O5W5xYze83qh1VandXCSLvFsOfVeLu25FxTm5UMjxo=
X-Received: by 2002:a17:902:690a:b0:193:1f3a:4977 with SMTP id
 j10-20020a170902690a00b001931f3a4977mr1628896plk.168.1673540447533; Thu, 12
 Jan 2023 08:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org> <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
 <Y8AwXG/c+IRyJ2U6@redhat.com>
In-Reply-To: <Y8AwXG/c+IRyJ2U6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 16:20:36 +0000
Message-ID: <CAFEAcA_EP2_0vm8r=12DBTG4a7X7aMYAy2x+K7YctZmSZWTv2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com, 
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 16:20:51 -0000

On Thu, 12 Jan 2023 at 16:08, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> I think the challenge is that osdep.h is too big as it exists
> today. The stuff the needs to come before system headers is
> actually little more than config-host.h and a few #defines
> most of which are specific to windows. If those critical
> #defines went into config-host.h, then we could have a rule
> 'config-host.h' must be included in all .c files as the first
> thing.

This doesn't seem much different to the rules we have today,
except you've renamed osdep.h to config-host.h...

> All the header files could just reference the specific
> system headers they care about instead of making everything
> from osdep.h visible in their namespace.  Still this would be
> quite a lot of work to adapt to at this point.

It certainly does have more in it than strictly necessary,
though we have thinned it out quite a bit from when we
first put in the convention. A lot of the functions at
the tail end of the file could be moved out into their
own headers, for instance -- patches welcome ;-)

> All the header files could just reference the specific
> system headers they care about instead of making everything
> from osdep.h visible in their namespace.

There are some complicated things in there, not always
limited to Windows. Also where there is some header
that needs a platform-specific workaround I prefer that
that header is pulled in by osdep.h. This avoids the
failure mode of "developer working on Linux directly
includes some-system-header.h; works fine on their machine,
but doesn't work on oddball-platform where the header
needs a workaround". (For instance, handling "sys/mman.h
on this system doesn't define MAP_ANONYMOUS", or the
backcompat stuff in glib-compat.h.)

thanks
-- PMM

