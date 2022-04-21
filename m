Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhZ6J-00034h-Bb
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 11:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZ6H-0002y6-S1
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 11:52:09 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZ6F-0003XS-9Q
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 11:52:09 -0400
Received: by mail-yb1-xb31.google.com with SMTP id m132so9505812ybm.4
 for <qemu-riscv@nongnu.org>; Thu, 21 Apr 2022 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
 b=ESCEcmys7QjpxE9JvTPMLCv9hn8DVKTSueXLHhYh5TaJfNFB8lBS4+B2Soz4ZttdKx
 3urBiMQFp1d0feE3FiwSnHqHHFUusRvdZH6Gb/0FuS0W6tjn1tr5SRBCEJaJg9zld8XP
 V5rPQkQe6JctonyCGEOxbrqO5cyPXXRBzI0/yJZAm8NIZxVbTW3W8XzPUOR7kjl5FmpG
 2eIFofM4t0pg02PTAA8fpWlWcogMDKysrbXhK2baBBIARxJeMuP8q1Wlmzl+0VvLADAQ
 pVCtTjOBDbmhjEsl1mO4jUY9o81echhtEWpKL13VpTUo+PpmxRpWIUQpdXxECPJCyNH9
 UeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
 b=NXZ3SuRsNx85u7Hut8fLnf5TbHP7AgllBAmuthXaqgyV6ut5JEL33Mm4CFAh38ogDc
 n9KmXcf9+IeIvmQACKk7HlbVvcB+D4SzwzhGaLoZ41KWf9sJn/guSAV4nNiq4Vy1wDv+
 /RLl46+SPAxsyCDSr6Ygj2RQsAhMxZcWY3YFQ9MUPMW23ZBObfRdVSuNduDHjcPw+qvJ
 7l6Xo7PO1o/epQzKIOg1ZZSslYsur6LZePCkSFi5VQMeW7ZVAGxNxlWvBV9xJRZXXu4M
 y26FYhY9HjA+8/4xc9MrYLiCbuyJhP0fzbQKbwLNnHN7Te1NdGsFnWd2e0uhsUicnNS8
 LWCg==
X-Gm-Message-State: AOAM530GKiAw0zueiA7WnwrzDfhWJfAdibtn5kdUdbWUT1eQAPYiU8q1
 Nu/aSSiV/QLXI/6g85MYSb0h+bgF6aCHp70qcl/F6Q==
X-Google-Smtp-Source: ABdhPJyx0g/PGsALkiCn9SGbhRD9+UPHgxirv4jcN1Bc4yXBfwzmHqVURHIF/h6BR3WnVvM27apU05tswaywt/cYYME=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr345447ybg.140.1650556326375; Thu, 21
 Apr 2022 08:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 16:51:55 +0100
Message-ID: <CAFEAcA-RW411mWCQOu03i=LaPHRm1F6R3Z9bquBDJPhv-ZxWGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, mark.burton@greensocs.com, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 15:52:10 -0000

On Wed, 30 Mar 2022 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> This series add devices to be able to user-create (coldplug) cpu
> clusters. The existing cpu cluster dictates how cpus are exposed
> in gdb, but it does not handle the cpu objects creation. This series
> adds a new device to handle both issues and adds support for two
> architectures: arm and riscv.
>
> Please look at patches 2 and 3 for more details about the new device.
>
> Last part concerning the riscv is rfc as I do non-backward compatible
> updates. I'm not sure what migration (or other) constraints we have
> on these machines and I probably need to make some changes to cope
> with them.
>
> This series almost deprecates the cpu-cluster type as all uses
> but one are replaced.

I don't think we should have two different concepts which
are "a group of CPUs". It means we wind up with two different
ways to do something (which we have too many examples of
already), only one of which gets to use the nicer, more obvious
name.

The stated motivation is to allow user creation of CPU clusters,
but I'm not sure how this would work -- CPUs need a lot of
things wiring up like interrupt lines and memory regions, which
you can't do on the command line anyway. Do you have an example
of what the new code lets you do?

thanks
-- PMM

