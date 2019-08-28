Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i30yq-0002hA-Sd
	for mharc-qemu-riscv@gnu.org; Wed, 28 Aug 2019 12:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i30yo-0002bU-CB
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 12:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i30yn-0008JR-9n
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 12:39:30 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i30yn-0008Ia-0u
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2019 12:39:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id z3so223416pln.6
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2019 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LUxprBBpjSfP1xthe+RhtRb0rOXCjhNnZp26xv1bGd8=;
 b=uN2PodegvmJGj4MK+vH56c78Gc7gyJqfDqFB2y4u452Tu+0NXfJVu0FyNc0yrMYxbd
 pRfGkQXKiIJjGIWH0IIvuRssm8cekYGCvp8Pe5gZPuxlFvJU3bGscl/tJ1IxpZPrblsI
 4qtqa1/Nj8kW6dx9pxqepmo7JvnYBJCrUCJRmGowaSpJmgTb9qgxSUvBH9A4zV/A3GIM
 6zn7CNw4l+4b4FTbzkPPUtzw36S42Z5F5wpgCfoGLdjzll/M9KT9JhB7qbJMCQU2y9Eu
 wemjDZDsXkQYnWrATdRxMYd+6/CdRIh15iKr6X9+1aYnsoouBVDfzqceBPZtqEU8PTOR
 kINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LUxprBBpjSfP1xthe+RhtRb0rOXCjhNnZp26xv1bGd8=;
 b=O7kVQXXmga3yiFVyxigRbRBdR9ZQbYXc9xnIDHKjpp5nX+HfaXKyBYAi9AJ4de3Nah
 Ryr4/UmDh5I9H287plK1LLNY9WTnZctZdJmqnGcqOibz+HRQ1OCLlR/EodS3JM9iMnl5
 DhhcdS3e6pQvRUjLWAVmvoktZ8WtZqCAXpv9LlcgdE2vaWYoOH9kn3tSJnHlXMUcMM31
 1DpwTCYAPX74cz4ehT8Kbkql8Y+Y0lBrDFAMn0ZvaTQuntwc628bgwCDfcgwCkf5hN8y
 b0li7qV36dgnU89EsQ3Qc31CoXyurlK4a9O6njC/+jA6iskJ4vq5iSGn/quUGvkgVIZ0
 ucSg==
X-Gm-Message-State: APjAAAWzzyul94lwW1L5USqYwwsJoep55dsLYHgW9xFHRBolKf+ZLGdZ
 EvtONQJexQFiZmosLu+b88EY3w==
X-Google-Smtp-Source: APXvYqwL9qVcLXwyeG2srmzf0Kfhw/Tux0mgs+ZEl8vi+wFaaprA/aBFzNMA6srIZBK5xyvtOXEkUw==
X-Received: by 2002:a17:902:b718:: with SMTP id
 d24mr5142759pls.204.1567010367263; 
 Wed, 28 Aug 2019 09:39:27 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x10sm2628081pjo.4.2019.08.28.09.39.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 09:39:26 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 liuzhiwei <zhiwei_liu@c-sky.com>
Cc: peter.maydell@linaro.org, palmer@sifive.com, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, qemu-devel@nongnu.org, laurent@vivier.eu,
 Alistair.Francis@wdc.com, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <87k1ax64io.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <876d43a4-7e57-b1c0-11b4-db20798d2098@linaro.org>
Date: Wed, 28 Aug 2019 09:39:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k1ax64io.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
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
X-List-Received-Date: Wed, 28 Aug 2019 16:39:31 -0000

On 8/28/19 2:08 AM, Alex Bennée wrote:
> If you want to do vectors I suggest you look at the TCGvec types for
> passing pointers to vector registers to helpers. In this case you will
> want to ensure your vector registers are properly aligned.

The risc-v vector extension is very different from any other existing vector
extension.  In particular, the locations of the vector elements vary
dynamically.  Except for certain special cases I doubt that risc-v can make
direct use of the generic TCG vector support.


r~

