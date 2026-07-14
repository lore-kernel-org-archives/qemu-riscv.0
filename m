Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD265C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 08:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjYsh-0007ql-OF; Tue, 14 Jul 2026 04:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjYsf-0007qB-Qa
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 04:52:45 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjYsd-0003fT-W7
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 04:52:45 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-81dfdbd86d1so7560527b3.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 01:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784019162; cv=none;
 d=google.com; s=arc-20260327;
 b=CP9lb39RAMP9YTpCz10/jVaqyozl8433Z8ihNZae380tDINe3Q0bFxuELgnzuCyxYK
 dbz8EtB9Qp/7iaESEMFQ6Sv7jhx3aS6kZbMQP5RE4LWS7r/iecll861i7fjQX1PY6qSb
 vbr0q2RGle9YgA8dZGVPijVS0IwjhjZ/oFlAXwDHU2kLws8bnRZGolRkD1GxhtjgLRN0
 jWct2P0toztFKxPej07Xymzjfg9l8Ia9WmzsxT4krd1m/HUlMuM3XnqTLeo30J+F0Jek
 fpiHh6PDdJYelu5xV7SM3M3ge7UCRYxQdpKbGRirg6+kkxbSRMO+d9myNaeqeKOTIPT/
 unmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QL/wKds2Y0rZ11D7iCVe8iDdXFTMhHVl5Zz6gZePVlE=;
 fh=XHaVOrzqAev7D3Ogrl50rJd5ZLLdwbKhIYuxRvGgpT4=;
 b=cPsDzUPwSPMKnTeXWlvLoLN4l+Qktl3QBxl7gULF2c0U7dusl2h+LFrpctk8nmxT9G
 DTJWS/ca1e/wiFKszI6LqVT+k5M1buWp6kGP3XKggY+u2uIUiaHDtvFNeI1Orq6IFJ5Q
 zVAuzmX1gVz/uut2Luo2LlER+v/ogPgF+aH+i/u9CDXuQnQHG0ld0BXtW+RF6o4tISlp
 huKNii0rEDzxng2Yiw8+AgMSumTb275+NKPm4VBWxDfPWhaX4yNZnfP5aAyB9+xUUnaR
 dJOH4rgTBJz9Z0Hzbbmf7Pho9BI/8NuEzM+qca08lK3Eps3Q9InaTvRvTqxtLV4hI7Vy
 7X7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784019162; x=1784623962; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QL/wKds2Y0rZ11D7iCVe8iDdXFTMhHVl5Zz6gZePVlE=;
 b=Bspwyma0H34Vhk10xuNmfQ1mo3eB2DDI/E+a/kXNRHbThDEkNLhqSLxPpn3+jow1Hw
 Ud1SptKermGy7CEsJ82BUpqUmmwr0wZI2nGVrzgrL1RlrkplBLb268Pf4o0XdqepyHsy
 HgnGFQSJRgOx6d9CU9nD93Q/ZCwlC8v9WU5x9wGH0m7+VyM7urEIat5jLWL8xverymap
 SVmxQhCsTvEsxLElIh+tZ9Tx57wv94qJfT6pEWLT7AMy/NrvPypYAIMHi0TL2UBL+IG0
 nCCkYa8q33G8+O5b4jy2Y6qbLYHfG3qUO+yarcnalLmlzWq1jWzwJF2qfCma135EHPuW
 Su8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784019162; x=1784623962;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QL/wKds2Y0rZ11D7iCVe8iDdXFTMhHVl5Zz6gZePVlE=;
 b=Y8Csxhps0TzK07HGaZSwr8z5QhXbNU6+0kaLyxHYYYs9p2YstHQ6UU/lvFGWPPsDFP
 y1uEMnE9Fv7JOuS/OnpqId2gT714JZTXHhnBNZboZtL/nyimBFfnMXB/MzBNXW5ABOsH
 cPulvYuqA17Uu2A9Zhq7pGtm3Y9MWVRHZmb0orcnyAz4kn1BoY5jURrXxPKExUeKzOd3
 UI1VEIQ/VnU4BoEk2Hf5MfWjuizkzebDLGA1HQxf7MOwuNs4Zk0wkU/BScXbTFtZSBc6
 NNG6+SqE/d3th3exG/0Rn3R/0glALrfrsedLabLdQ2suLDvloo6zYYLNHvkHG951Lyz7
 IqDg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqifwbegU6c0Qxh8ZbV8wQV0Mm2fy07zZNk0rbbdaZ/NT4lFoVBtxRsPEL/1WmC0pkmT+GbEaYgIAZj@nongnu.org
X-Gm-Message-State: AOJu0Yy1hTU53ofH/b/uJjTkNshhQfdeLYma1Aq6Mu3tz4m7DpNQuNb6
 fHQZFLmdTlq9hKKYoYq5XaGd/Zb7Hs4FQJFJJL17+lYDdPwZkoa7wvF9Z6//gP1TeDIbwqLRdEx
 RlqA6vVepCuNohxuEqYc7GodR34nywjZ2xqCume30VA==
X-Gm-Gg: AfdE7ckWa90WgHqjGeRZdhOAcAs3tikqW9dL4I1QBLTJhGWcW+86OlotxUcX2cWV/8u
 QWG7dkdIYQRmcHWjIRSTMIqCbUdH+KAcnTYPeRbLp5/vb8N6rm6582MAJpa7KUNZGANeSLyChw7
 NYjbogxMs6jSv22QtJB6veT379iwm7pBLNhDmrIOaQMd9vH0RSArBmqYePj1x8dYkr9Htc5Hx0c
 V4QmQfj2fEXLItv+bAfohUzwaDhE7szZ13fx6gLpPyFgjASVf2DN/eTRLZNw/XZIt7NSdE79J99
 kUUx0L9meEqoWnNI6ekEQ6vcNhe98QwNSMFEwMSY0j4UfkP357cKXN6g
X-Received: by 2002:a05:690c:3603:b0:81c:e8ab:c4ed with SMTP id
 00721157ae682-81e90181e3bmr93385797b3.51.1784019162146; Tue, 14 Jul 2026
 01:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
 <24329582-f5cf-41de-aabe-c2c3d54f03ea@oss.qualcomm.com>
 <tencent_3045B23CF7A9872F29FC351E24D8F9373F07@qq.com>
 <6c0ff642-8125-4c35-8ed0-8f89da555ee9@oss.qualcomm.com>
In-Reply-To: <6c0ff642-8125-4c35-8ed0-8f89da555ee9@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jul 2026 09:52:30 +0100
X-Gm-Features: AUfX_mzDxOCUO2U47PkEe6TS2caoUo6qynmsAPH3uE3iZ1T4Mvu6THCAwsO2iPY
Message-ID: <CAFEAcA-AqgGDgRkkc4MzCcE1zeMT-aWbYoyPYsUJsYShy0-0dA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv/virt: Add optional UART1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sun, 5 Jul 2026 at 23:05, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 4/7/26 03:41, Yanfeng Liu wrote:
> >
> > Philippe,
> >
> > The v1 always creates UART1 carelessly, then Peter suggested following
> > 5d8a250f9068 (openrisc) and e7100972f2 (arm) to reduce guest breakage.
>
> Oh I missed that. I'm confused because I thought not checking for
> backend use of a chardev (in particular calling serial_hd) was part
> of Peter's recommendations, since he did that cleanup years ago.

Where we're modelling a real piece of hardware that always has,
say, two UARTs, we want to always create both UARTs (because they're
always there in the real hardware, whether there's a serial cable
plugged into them or not). Having the chardev code handle "backend
is NULL" as equivalent to "this is the do-nothing backend" lets us
avoid unnecessary conditionals in the board code.

For "virtual" board types where it's QEMU defining what they are,
the situation is a little different. Ideally we'd do the simple
thing, i.e. "just create all the devices", but where there's
existing guest software that makes assumptions about how older
versions of QEMU used to behave and the number of users of the
board type is big enough that we care about not breaking that,
we sometimes need to do something else. The "only create the
second UART if the user puts another -serial option on the
command line" was the best idea I could come up with for letting
the user opt into the extra functionality if they needed it.

(If we have another future architecture that creates a "virt"
board type we should make sure we have it create at least two
UARTs right from the beginning, because we've now made this
mistake twice :-))

-- PMM

