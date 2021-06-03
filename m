Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loqPm-0006mp-Qg
	for mharc-qemu-riscv@gnu.org; Thu, 03 Jun 2021 12:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqPk-0006gd-W3
 for qemu-riscv@nongnu.org; Thu, 03 Jun 2021 12:41:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqPi-0000c3-6s
 for qemu-riscv@nongnu.org; Thu, 03 Jun 2021 12:41:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id l2so6529400wrw.6
 for <qemu-riscv@nongnu.org>; Thu, 03 Jun 2021 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IPc3+X5caB5cAiN2TFaHpeBZ0ybctSssJuP21+y7iz4=;
 b=otO8Bu+vJjS6zWy1NZmBTCwLd+5rSbhBeIYm219+MsKLoE6AQZsTdlJreN96YhxrQS
 oFLzv7STXiGDjKaiCssIvPNmiY9D5AIFg9itSsjp0HjY6Z10GgWgzX4yYckU+yLhtSXT
 EfGHxpyYtv9JHPVaij7jF06v3LFscSfD/zsiJbco0qL/702JedLMTp4LaxWXzbEECU+x
 fyqLNVfikI8CCGxrNGjtc7Wzg53nw5bzzAHl1/rq2j/+3WIpOfOUk5vS3RAuGFrYmuo2
 j6HiQ8Om/Po3X69ZvjfbOn7dm0nrafo+NW4gSWUsUfwm3PvnsmQGvjDWI5bZ+PCjoSLx
 gdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IPc3+X5caB5cAiN2TFaHpeBZ0ybctSssJuP21+y7iz4=;
 b=tVhcvAElNmXzcAcrmkD+7JGcAkro77H42eNqoaFDZ1RxTsqnSsWGzRmdMF+Ans/ZFH
 S4FRpyIE8tjsas9AIHbUfL5isCXshKavuJ4US1cDAWsdCOMTI8aZWgmjCllRi8v9bBsU
 sCnVTRVDV7cE2rLeQCz/mJ6GXe2/YZOOU+9IA6f8ek5npKyiG12/hLm4UNvazmB6TVqy
 lAKWwa5BOg9Zgj5gXmtIwJ53x9RVMI3zD9sFn3tQ9QY1XRlhmxM+qaRy630RXwpTk+xU
 QYrBHIPen2S04ddPRMeLSXfwJfzbTmCBwD21eilb1T3UyGyJEMgNPRzEcV2pIGr9HgMf
 tuCg==
X-Gm-Message-State: AOAM533b2ppUvAX20dB93mybO94z7iPbGP3dL/vmooHE7tZLBrcq1Ell
 D1hQZ4AJDueYcnt6JnDKtv3NMQ==
X-Google-Smtp-Source: ABdhPJylx+pDmQHSUgv1mRq9HuVIah9G3ZgRZOiZ+xuNYOuQpa/PXLHwlHumhBnY3HafBL9KKl7Fug==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr854686wrs.74.1622738504443;
 Thu, 03 Jun 2021 09:41:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm6250309wmj.1.2021.06.03.09.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:41:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D6BB1FF7E;
 Thu,  3 Jun 2021 17:41:42 +0100 (BST)
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
 <20210517200416.pt4xghxiuzuwknvn@habkost.net>
 <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Alistair Francis
 <alistair.francis@wdc.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
Date: Thu, 03 Jun 2021 17:40:31 +0100
In-reply-to: <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
Message-ID: <87tume7veh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jun 2021 16:41:49 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/17/21 10:04 PM, Eduardo Habkost wrote:
>> On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
>>> CCing Build system architecture maintainer (Daniel).
>>=20
>> Oops, I was misled by the subsection title.  Daniel is
>> responsible only for the build system documentation.
>>=20
>> Do we have any volunteers willing to be listed as reviewers for
>> build system changes in MAINTAINERS?  meson.build has a
>> non-trivial amount of code and no maintainers or reviewers at
>> all.
>
> Hmmm OK I can add an entry. Ideally with Paolo/Thomas but I don't
> think they want to be listed in any new section ;)
>
>>> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> Various Kconfig fixes when building stand-alone machine binaries.
>>>
>>> Who should merge this once it's ready?
>
> Paolo said in v1 that I can send the pull request myself :))
>
> I will do it in the next 48h~.

Did this happen? I tried to apply the series but it conflicted straight
away.=20

--=20
Alex Benn=C3=A9e

