Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYCpO-0000nx-9o
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 14:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCpM-0000if-6X
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:06:56 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCpL-0003lE-Az
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:06:55 -0400
Received: by mail-pj1-x1043.google.com with SMTP id t40so8162709pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uQg3dk1dcqkq8wLY3L2wO/TVKMBfc+kSyde7iV+E11g=;
 b=aYZmNgIk5PScUe6R6YK7CPabwsm3i9EKLilo1oGHDp8eCbHklA/oa9K1hlqU6iKYFr
 ZafTs3bAuPInj0fErwQn9A+hsBHACAxIQkjZbHq6Ic7vcKukEInaWsr3V8d3eWf+Dg2q
 seZYIYR3vJy9ZLkwT2S/3JWsnZdRO1YpG6RzlvcB53TWVEwz0kkuHDPliO7vmoigUDz+
 nY4uyMoUj8Fnl08pqDfoVY7IjBy/HjHnkGhXKseroulXPzSFBcJIZCOB/wCOolNfOF7n
 Si92YzAZ6SAdi3DIWRK+vMr1BGT3m37vImijOIruwdo4WVmG0CgNqhxFvbpNOAs/QXjr
 2NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uQg3dk1dcqkq8wLY3L2wO/TVKMBfc+kSyde7iV+E11g=;
 b=QLBY0qAzv+qPNSyb8aumDR43eQQnXtUMxU1iuSWTr9mzG1Rfd/wM9kTJhcMflktHH2
 LIyb+cHvO25xzF4D/XwXb171VmtLO7yRjXq329v3TKLFPFBWTbpvS5BFWp8BaEDznnW1
 B/w5llxC0P2jW3o2n/voNIyjO89kUgmsToDQrVZ3bQXqUspyFdExAWbkMViQqXMSf9l5
 WojDL0RObmHy7dnnHYA8g9O2LBql86QoUbzSh+/CQ237NSe1O7A/fLMytUgdpa6wHVYq
 d9/9F8XOtU3ztAVOfeduMr72iJkHc6x65/EyopQ6HIt1RAU3RoLSG3UD8XLBjdgtHz3b
 4+xQ==
X-Gm-Message-State: AGi0Pub47fwfaHJ+niU8MJqouRA/nTne2pZl9Yk6PZzL9QvFbzxwfySS
 NXwNKaAzVbuv1xdGQ+/7D1u5N+2vJ/4=
X-Google-Smtp-Source: APiQypLOqG1cSWUB7b+5FsDbcM3AXgmP6wa4tBQtQ4Sj1PYXV8zO4m8o4KhEqAV0lSojnTr/WxYieA==
X-Received: by 2002:a17:902:8688:: with SMTP id
 g8mr16984894plo.268.1589220413721; 
 Mon, 11 May 2020 11:06:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g9sm8539998pgj.89.2020.05.11.11.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:06:52 -0700 (PDT)
Subject: Re: [RFC PATCH 6/8] riscv: Add configure script
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a434ed23-5102-b39b-8fff-0f60e493e488@linaro.org>
Date: Mon, 11 May 2020 11:06:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 11 May 2020 18:06:56 -0000

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> +++ b/configure
> @@ -58,6 +58,8 @@ guess_arch() {
>          ARCH="m68k"
>      elif check_define __powerpc64__ ; then
>          ARCH="ppc64"
> +    elif check_define __riscv ; then
> +        ARCH="riscv64"
>      else
>          echo "This cpu is not supported by risu. Try -h. " >&2
>          exit 1

Why "riscv64" and not "riscv"?

You can't really say more without checking __riscv_xlen.


r~

