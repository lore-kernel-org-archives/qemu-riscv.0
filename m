Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92425C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZETq-00065W-Dp; Tue, 08 Jul 2025 15:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZCO7-0008Bz-Kq
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:45:52 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZCMn-0002HX-Jp
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:45:47 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-60be827f2b7so82701eaf.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996648; x=1752601448; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHI/pe/hYxCWaN7ZHnWIgGI8hQCDTXyWj/FvjsArrTs=;
 b=UxQlEhCs61sUNKGEdNFv82Ll+ML9+MUzz+iq6XxOni/zkRdGQntf1l6dqeG70PAU4f
 jb9+cWf6r+QS/WCK1HcCIzZ7N3wQFdtKjMvGr9+ZFqdEN4sF6ykPiJVFJjSsua9AFtz4
 d+5Bdb4iMp6VCbksYpmolQ1a7CzEJXHr47oZTmILjFctZ9m6+Le5RTAb/G6/yy/R9r62
 PzxSPZ8bCFoFGCaPYdrwNO04WoRC8mQmNI8jjB28D8Lh6nf+EW7ozl5Oz95fbX0b6SvN
 Gt0CvP/0UWdeXLyI4cxo7vKkO6YBsFCv5WKvy04POLAf4SginTu65iBlgbxsVF9wOkBs
 9EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996648; x=1752601448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHI/pe/hYxCWaN7ZHnWIgGI8hQCDTXyWj/FvjsArrTs=;
 b=e87qNz+NrE1ULr+aEYHborujLv7Rg0F+COIRUaJRbDiaXWHJdBdOq+3bR+wZaBshXc
 Mt2exQJfzvKsp00q4nbiE1QMLHkYe+G2Ct7zgV86ztr8FOJu7v8XZO76YyVZEBzkUeU9
 eZvIGggxm0LejPXbPlA1GGnYUJDtjNrWyIcydIsa+RKJc/dl00N3y/CWiYjPKAhf+a7Y
 cyljEdH9/LIT0nQLQoSBLH89UxI7Pqp59OtE2rTlMEerVV9FNgZrp/b0gQp5Qr0t6OD7
 2s7pS01AJU8QqKBanbNy76+DQww5ECTAAILSTLqxae6EHC3aFyGLJgnhnJa0fqSzKmtk
 LciQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNHxa/zd4bZAfMBT+HZOYgFu5vEfSPHgOSCRt4zxQeYCF83V/DKEwhxwibbdvd2wzNCbM0zmTkQ7/@nongnu.org
X-Gm-Message-State: AOJu0YxnFJfX5XZ8F1LssR4xcvoyf/2vBsckzD7+lFfWmNnZc3+8g+70
 sWBECKxpe36xnPErtNfmMGGDwZiC4SKS+xl4fP1gSP1XcTAnh9Ps0jCTYc5xyYVfYP6yK0dGbJV
 hIhsP
X-Gm-Gg: ASbGncsbx/jrl8HMSoFT7azSvYjbE/BMe4W2S0rB/fNN+gtc1QGjbfJFCy6XwweRxD8
 1jIDj7gBJyBw2StxNgkZ4n0mwGqgyhjY4LSlT9KH5Q+AI2B38Tfdcil/AlrJy8aHsfNLMeseUsg
 SnJRdKfeF4UN6iIXQsHyrNko/QyLqRAwYa0uxDUxkua42TzEfExH8fz5qu1eKTe8BxsfJgSvc/7
 4cPaBUzGrTT33J8SjKy9/qpTAYkELbfuYynj9gquQ1DBPOo2RPYdBvaKn1poGe+pywEDD4WfZRA
 a7BUfknMWQdZH2h4QUL8AN21/W+oxnoe8mUMlYUWVx45BQPJFZg4V77+zh2OPOfffTqeocZBtg1
 dRgTDxPXweA==
X-Google-Smtp-Source: AGHT+IHVgoyd0HH+KmsdHkQpMJxYW0hptSnGBPEC8SUBQ0yvzQICg0NnhyPOCx14mOIWwKBsXyhJFQ==
X-Received: by 2002:a05:6a00:1ad0:b0:744:a240:fb1b with SMTP id
 d2e1a72fcca58-74d2678c6c4mr5240287b3a.5.1751996182113; 
 Tue, 08 Jul 2025 10:36:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42cefccsm12116590b3a.156.2025.07.08.10.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:36:21 -0700 (PDT)
Message-ID: <e319122d-f7f6-4b37-930e-87d2750557f3@linaro.org>
Date: Tue, 8 Jul 2025 10:36:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1? v7 8/8] hw/virtio: Build various files once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-oo1-xc31.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Now that various VirtIO files don't use target specific
> API anymore, we can move them to the system_ss[] source
> set to build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> MST prefers to defer this one to 10.2.
> 
>   hw/virtio/virtio-config-io.c |  1 -
>   hw/block/meson.build         |  6 ++++--
>   hw/virtio/meson.build        | 20 +++++++++++---------
>   3 files changed, 15 insertions(+), 12 deletions(-)

Good job!
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


