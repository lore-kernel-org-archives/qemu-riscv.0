Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC097606A893
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qs+WuZSx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT1ta-0005P9-Rs; Mon, 16 Nov 2026 13:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1tY-0005Nw-Py
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 13:57:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1tX-0006Lo-4d
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 13:57:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so1850667f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794855453; x=1795460253; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RIC6/AdPDOweSTfySBAr8bYI/5fnqpqzSYxDbZyga2Y=;
 b=qs+WuZSxAMf0tMrjoRUrewh0DBhkMTKMnOOiKmoK7Iz6bI/p2kWPsi6UtMzVITYhnL
 TdFbR4UXk8KLV5Lr/kkDrX5/CLqgKUwzY0V3UjgatPxfQelCfqPS/Mcu0At8wE6c03DR
 AL3hRkzMLY2yQV0UcvljFzwQFafaY3qyth3dF9bpqABGsXK9FWzKtWkvEZpiIp4IzG7X
 NXwNATf8mcUsbCjVspEVZ2zcw5F3j3riAGvDsCuSjDVd3KJrzLmP+E+5pSQHQuMHpx3N
 Xx+GY2WrRjMWIi7N6JKJrE+RAUBKttncHRsOawtSeorYORYeFmNnk6MaCcaEYraoGK3H
 XBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794855453; x=1795460253;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RIC6/AdPDOweSTfySBAr8bYI/5fnqpqzSYxDbZyga2Y=;
 b=ulHy/g7qQmM6hKP4iJmPP6wIqumQPbAXSIQSKxXr+d8vXF7HppAm9TQmr6uxp9jDpc
 +xwB+yXqoDfvcqz1u4JvG5n/faVmb86milp0LDsDgeY0RLlShhucN3TBiHQgNb01JfAU
 ruH7C0RYhXX1radYBFOx4iv1dtUzVdeey8CHJ5KAs47Z3kB41mU9SdEZchhXk1rwk8Hq
 UqChxqa3nxQ+tBV9mhKSAnH32/v6iTn00JLEYnbLNyO2S5SFesIKxUV6e6PNcFbgzFAg
 MtiE86ZQ8K3Aex0yMvmsBiowCKwlYy/UhM/B21DnLJf3Wp0NtAy+Um1DwTdEVKt5cT5l
 Vdjg==
X-Forwarded-Encrypted: i=1;
 AL+hErGTCZtJRGYgkptwwaUhRUfOVF/bK7ceFR4kWVpirijQcZcq2qGqnv03iSGkqrd9FbBbcj/qXDo8B11/@nongnu.org
X-Gm-Message-State: APuU4Z9v20GR100ui07kZayXTo6jPe9UGY5gfXYI884nQ/NPJyESJ65s
 W4c+GiGwQB0WQ/2wTc94yAbYNWKkhzi13XKZnFxmKJUwDDRwwic6btt3OvoaPqqt5aI=
X-Gm-Gg: AZFdTZc4kyXgR2564nqfzmwIAh0NMF2oBN53kdCPq7YX4oMJ6mMRU9jworBFX+WG++j
 5NxO8CaRzktfchgMrCU2d7hWYHTBLwl3VhHloPaQD0Sz0bf8jZvp5dirQXZVo1hbD95PX+J7/dI
 VLJGcockMTGD6ss0iSBYNbTMf20Yiyi9OZYsh5UOrYr6g5Arc8CPver93JlwwuRIwABCjnITcR1
 215Wysi9iJZwniq+/sgm0e1UhhRTPHZA5whvGIh3YLzv2Wbyx+X2/XTDSynMS3cvUGtFlgW84tX
 pLRLzqkKO6JEkyTW4fAbXYgKXDHJnEE40J4SZc9L/uqIysgLJXHN3LRZFEdRIysQA0iH33jmkWF
 hXcD6fCZDTluDutISdT7XkzTAHeMIOHaXu6Jj8FQFZx9Cyyck8A7jXJeBY5dP5xw/IFN2AoVHux
 bkah1oXGKB6jm2oprxQP8C+vxfXjX2PSN1J/gqDOpybppKyH+x0DfS/mJrHv9Out5A6vdYygQsZ
 tgLbqN6LQk765JHSzzBvy46/um3su8MZOxRhoYWn2WzdtHTF8/o1i2UtsFGPujxcm2fVX47Nr1J
 2IQllCMpZ8Hyj4Ry8BnjnMGi+kyt
X-Received: by 2002:a05:6000:4024:b0:490:d197:bde8 with SMTP id
 ffacd0b85a97d-49c6b972aedmr28472431f8f.0.1794855453450; 
 Mon, 16 Nov 2026 10:57:33 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm19789038f8f.20.2026.11.16.10.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 10:57:32 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8EB6F5F8FE;
 Mon, 16 Nov 2026 18:57:31 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
 Junjie Cao <junjie.cao@intel.com>
Subject: Re: [PATCH v2 28/28] hw/usb: mark UHCI, OCHI & ECHI USB hosts as
 secure
In-Reply-To: <1711cf10-2719-4d6a-93f2-b7a3a7554ecb@redhat.com> (Thomas Huth's
 message of "Fri, 6 Nov 2026 13:28:18 +0100")
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-29-berrange@redhat.com>
 <1711cf10-2719-4d6a-93f2-b7a3a7554ecb@redhat.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Mon, 16 Nov 2026 18:57:31 +0000
Message-ID: <87zev8ioys.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas Huth <thuth@redhat.com> writes:

> On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
>> Modern virtualized guests are expected to be deployed with the
>> XHCI controller which supports all of USB 1, 2 and 3. The UHCI
>> OCHI and ECHI hosts, however, have all been widely used in
>> virtualization scenarios historically, especially on x86. Indeed
>> the -usb flag will enable UCHI by default.
>> So while these are undesirable hosts in general, this marks them
>> as secure for virtualization use cases.
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>   hw/usb/hcd-ehci-pci.c    | 1 +
>>   hw/usb/hcd-ehci-sysbus.c | 7 +++++++
>>   hw/usb/hcd-ohci-pci.c    | 1 +
>>   hw/usb/hcd-ohci-sysbus.c | 1 +
>>   hw/usb/hcd-uhci.c        | 1 +
>>   5 files changed, 11 insertions(+)
> I'd also rather drop this patch until we've got a proper USB
> maintainer again. Otherwise we promise that these devices are secure,
> but nobody really takes care of security related issues in the end.
> (It's already exhausting enough to get XHCI into a proper shape again)
>

+1 - it's not like users can't use USB but the warning from failing with
secure will at least make them go in with eyes open/look for
alternatives.

>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

