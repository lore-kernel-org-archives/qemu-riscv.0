Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3C5C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:00:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFDs-00051K-0D; Tue, 08 Jul 2025 16:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDtt-0002Su-KW
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:22:50 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDto-000179-VQ
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:22:45 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7d467a1d9e4so25724485a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002557; x=1752607357; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5gSjuATTx72GOZz467qIDKmTtfJ/K9yb+xo8zZDWtOk=;
 b=Z43lr8Nwc2fBLoaB1bZW2HT51JXc4N6RIPsN2Z9CWcb4CrxglgpVq53JwIcA3zGw83
 tYU0wNDPWhlCPFPu3MmiJVteMvODsNwrXWdfw8P7RC2Gfs9lO+xppDXWHkZsyJTQbX7x
 CkiJPS5PwbhwgD07VwY4H6yq0A7Y4Esvp/pLBjlDyehdmOYJ0fU86ywFEBHWV8c7S9B5
 1c5lr8p0zC1zl7xiUdv6UldA+KrzMocCDWOkNJzvhriRMmLbqU8psy3mkXiT6TtlEmnN
 joRkNIXFTc+cDC6haYoAz95av6cXHZXsZXJOgmsynjzM4LPXgkXn/TYzWUwBx6SJE38Z
 B2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002557; x=1752607357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gSjuATTx72GOZz467qIDKmTtfJ/K9yb+xo8zZDWtOk=;
 b=DSOTmXYLxlt+uLSSKQlzf9xP281a10aM12g64/5aO9FaZ6K3+P6RGQAnoDxwyuCjl3
 cIjz08RE7p5tOVftTpb3W13UUIwLsI2B0hZCjfL6ZfdD/qau+SwDKwhoUiDK4UviBh+a
 IW8Xv5cLcHVHDYSxvk52dLZe+RS2itTZrwOh/GqLt3hg4Ynjy4qWwxbbcd59l6fFT/+t
 fUzocc5g4e/kowiAhJ5vjIvl7uSBvEO/tHWUIkCZzAsqow8EWtgmAv5uhDhEUAW25l9f
 u1JOdM/zobvmCN1a9IZkfh008sH4/QAdYLPaER7+vcq8BMhyimMxrYJqeBzmI8ApSasn
 w1Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwIMUKGwYFO/jDJhma96SrEKy8Yx1jqUFLKKLwCV65j6f/IdyogHjOmkhAa7MC9BkEf0NL03nAcTXL@nongnu.org
X-Gm-Message-State: AOJu0YwQZmD0Nj6wx5mLpnyXZ+p+kQS+9tPf+lUWNo8OgtJLXK1USliM
 N1jszFDObdf8IanVsils8H5tkSnkSNRnZ/ndHqtMwBGlI1WlwtI7zMSBM8o8IKJ6z1aO6GCpmEA
 61e37
X-Gm-Gg: ASbGncu2RjcO4VKvo7PuwLTqflcF7OLu38wFpRucRnlAX0Caoi10YFBryvOBQl9vP51
 mK3uv9quCa5+2Vi2ixg6XDYTtHGy48by/cKiRscVosKyVeY6aWNWfJn+iVRFuzGlzCyj3CztkSE
 W9/Oe1PIu7Vck9Wu0PZu/jZo8MXyTAiUx8LACgsGryxOkU41qDw9c4dewAgy5r/9h3aBOcAUurS
 S241w3mp7K/s1NWUhfIQIqWXvU2Z39qstyrSLPIZ85V50cbk8KSu9e65qUuuTwA/oyfEKBzsxiW
 jvL8UBQhS9WI16PkfMM+eIvXwoEZOmjveQd/FVsEZiplMJmNGtIRUgijmQM+PhsTA1bfHtxB3LE
 =
X-Google-Smtp-Source: AGHT+IEkizQaQtMXancy/7xviF7/nV/9CuG4CcqSvXpkj09rbW5kDvKUk7aJ9PLQYz2Q785lGeVQJA==
X-Received: by 2002:a05:6a20:3d0a:b0:21f:4ecc:119d with SMTP id
 adf61e73a8af0-22b669e7f6dmr4910385637.7.1751995933879; 
 Tue, 08 Jul 2025 10:32:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3924868c3dsm4334342a12.23.2025.07.08.10.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:32:13 -0700 (PDT)
Message-ID: <4c89172b-1214-459d-9d0b-221347ce59d2@linaro.org>
Date: Tue, 8 Jul 2025 10:32:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 2/8] qemu/target-info: Factor target_arch() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qk1-x735.google.com
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
> To keep "qemu/target-info.h" self-contained to native
> types, declare target_arch() -- which returns a QAPI
> type -- in "qemu/target-info-qapi.h".
> 
> No logical change.
> 
> Keeping native types in "qemu/target-info.h" is necessary
> to keep building tests such tests/tcg/plugins/mem.c, as
> per the comment added in commit ecbcc9ead2f ("tests/tcg:
> add a system test to check memory instrumentation"):
> 
> /*
>   * plugins should not include anything from QEMU aside from the
>   * API header. However as this is a test plugin to exercise the
>   * internals of QEMU and we want to avoid needless code duplication we
>   * do so here. bswap.h is pretty self-contained although it needs a
>   * few things provided by compiler.h.
>   */
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/target-info-qapi.h | 21 +++++++++++++++++++++
>   include/qemu/target-info.h      |  2 +-
>   hw/core/machine-qmp-cmds.c      |  8 +++-----
>   target-info.c                   |  8 ++++++++
>   4 files changed, 33 insertions(+), 6 deletions(-)
>   create mode 100644 include/qemu/target-info-qapi.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


