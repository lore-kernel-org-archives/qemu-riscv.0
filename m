Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1XtR-0002OP-1e
	for mharc-qemu-riscv@gnu.org; Tue, 11 Feb 2020 10:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1XtO-0002LB-AM
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1XtN-0006JZ-3z
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:56:06 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1XtM-0006Iy-Ub
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:56:05 -0500
Received: by mail-pj1-x1041.google.com with SMTP id n96so1485688pjc.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Feb 2020 07:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOk9GEk8P97Nr46FRq3IM9r/5hhIciqeGkunvl9OamQ=;
 b=B0t1iFcSlUp8EdhF5M6r0ToWHz+dvNYm8TjUumCfuMfflP3ueM6Yy0ZeTSNyl4cgKw
 wRsbQ3OR9I3s1gYqr/gDbw0TrM0zblFDD9QZla2am9wUVBmYAINNMrCPXMXrB48jlmiH
 7np3QfYLBJ+fNxJrUPy5N43gvGIsljBAmRTZUQ+t0kwVSfra3KAhGeabxz6w4Kb6S/5W
 SqQBheCDtHMGBGknWX/TGN6zhS1+tOvu8m9s6zgl1/NeCuJkUmdXZw+WX2qFDD0wOQeT
 qZDKfya4DQ7ahMIuZcvk7O7b3BBJiA8SAhKvDf9IsO+DES1+XPDCFWtpFMWjN1QPJ6Hp
 vKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOk9GEk8P97Nr46FRq3IM9r/5hhIciqeGkunvl9OamQ=;
 b=b/vDMi0Ds0WQR3RBmlsaXp8bijVsYX3g7JF7qHZYEjwut+SjRLY+Y+i1dA59wp1euV
 //6vaptwAle6rEdkKWHCS06Eup+ZQaHRbWcs/b5MiBnwn7e2Qw+qcnKu1QRXSaX9YJYl
 gF6AViUlodStl96eCi47Nq9LX8lYyd+pPv0SmfiFBPYmXB4dbwJ7oJzeEnrq3D4d5KxY
 ts9MFtJyJghOtx5cPENMEpxZB7C/S1I6Ms9jhCxuNgZsRvNXM3Ay8dNqZEsH7ertMH8a
 6WJGuoiuy+ydP4vul1tlJUkHNQ7p7DdaKRcI86SAwZJrTiiIMRCMgAZ99wqchMFz00z+
 VQCw==
X-Gm-Message-State: APjAAAXcJLl4gpBOaZVY22fBSL6LGmKyyoZkTmvFGzKJKsLdEAK+yuET
 GP/isua3GC9IgG1v9539LTh/to57viY=
X-Google-Smtp-Source: APXvYqwVvzaH/BlUTphcFqRVnMy/yK50hn4/J1hbAU7/n5f0+sLnE5oOzDLPRny0YMQ/4DqiMhzwmg==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20mr19070104plp.6.1581436563595; 
 Tue, 11 Feb 2020 07:56:03 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e38sm4333195pgm.82.2020.02.11.07.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 07:56:02 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/riscv: configure and turn on vector
 extension from command line
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a1182b3-b92a-51b1-1784-4324250fb2dd@linaro.org>
Date: Tue, 11 Feb 2020 07:56:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210081240.11481-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Tue, 11 Feb 2020 15:56:07 -0000

On 2/10/20 8:12 AM, LIU Zhiwei wrote:
> +            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> +                error_setg(errp,
> +                       "Vector extension implementation only supports VLEN "
> +                       "in the range [128, %d]", RV_VLEN_MAX);
> +                return;
> +            }
> +            if (!is_power_of_2(cpu->cfg.elen)) {
> +                error_setg(errp,
> +                       "Vector extension ELEN must be power of 2");
> +                return;
> +            }
> +            if (cpu->cfg.elen > 64) {
> +                error_setg(errp,
> +                       "Vector extension ELEN must <= 64");
> +                return;
> +            }

ELEN should use the same "only supports ELEN in the range" language as VLEN.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

