Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDIUC-00059v-Mj
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 21:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDIU8-00059Q-MW
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDIU3-0006lx-2f
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:54:36 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45873)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDIU2-0006hw-OK
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:54:31 -0400
Received: by mail-pl1-x642.google.com with SMTP id b22so6150520pls.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 18:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTSphg/7spynbkKjgV3IISJwXHBHCMFIRYULb83xpTA=;
 b=fLHrI6LaGneXX6Oqe1x0Gnn2uaxmNIljlq+w6iUIu8RUtAlf7IDHvf6L5oubAl2qah
 awg8XkxpnZpcqVf2u7qR2Dbc1CY/6kmnTKFWtvjGOQ1HO6hhZ4s/aimePJXGIU3zOAgg
 pDkIM0tiTRzIXe9vz494sgIQihbYRttDBmpYvV0HG+yQRy/rh1PYlTu5rl918XQ4INhr
 0vbyhrsl653axt4k62ArPiTH06WTgXpxU7v2bDGex2On+OElGtZTRJTp6dYtBGWQPzct
 LNpLBbHgMHbloouGXicScyxtLBpSYxHNFm0qiSnBaLubTcMEuWXsMWkptC/V1KLZGebx
 1cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTSphg/7spynbkKjgV3IISJwXHBHCMFIRYULb83xpTA=;
 b=iP2MbczjnyQtBrOKNaqtdC4YtApV3Yt8K3wTp43NasEY6B1wgY7A2oQPBuYjb/Ioqu
 jzDDhQfkCV7uIiDAEfU3651qzS4iCTasdj/ymskmumdZC0iDjuxxEOhNaciw7yIwT5C3
 xURbCi9GgIhxGQd+ej1IF4ID2hyxic4VbDXfUCsocnVdnrViZHzcKD1DRHLAjd4F+F2+
 OdgjcIkeNS3acSXzSPYoVPeL8lzDSkaQR7EPrYjYoNTpSExivjK282LJpWArexLxI2zk
 lrA0Ivdr6exSE8BB9j5UPJ5/BZuzAYSruqSxPPssockUDxp6/uE7eo9da16pWjf4xI/C
 ddTw==
X-Gm-Message-State: ANhLgQ3rxC2KF6t3mjS00b5TDOX9OQJPTIo0E/oru01N9+3rYvcH+Iok
 uPOnfX+fgmspYz1mI24EEuIqXagSj0Y=
X-Google-Smtp-Source: ADFU+vtjGooFmwO021q0bhA6r9I+4oNh7WDdgy3JflmyiLrawJJCKF5GJ+m86PGHViv8raQPeHktsA==
X-Received: by 2002:a17:902:be0d:: with SMTP id
 r13mr19805210pls.273.1584237268317; 
 Sat, 14 Mar 2020 18:54:28 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 x21sm11514177pfa.212.2020.03.14.18.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 18:54:27 -0700 (PDT)
Subject: Re: [PATCH v5 53/60] target/riscv: vector element index instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-54-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d5d45b2-770b-be40-4e74-ce3cdb1cd48c@linaro.org>
Date: Sat, 14 Mar 2020 18:54:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-54-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Sun, 15 Mar 2020 01:54:38 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  5 +++++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 21 ++++++++++++++++++++
>  target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
>  4 files changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


