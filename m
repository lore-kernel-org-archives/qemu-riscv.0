Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDGIF-0008JU-8u
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGID-0008JJ-GX
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGIC-0000T1-Df
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:34:09 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDGIC-0000RF-97
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:34:08 -0400
Received: by mail-pl1-x644.google.com with SMTP id ay11so6072378plb.0
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pDw4VV2ffMQG3yt5Zv/YbUVKu4oDT8jkTF9gh1DDSJA=;
 b=TZVdkgyM09OIVtrnDMIIOM37DdHjl5N2yLxmkVWDk557g/5cZd6V79lDUKO/4FMjZO
 UdY0mj0JMiPQWGAuOce5BItRIEtx2mnC/UdtvvstPOj2r5j06+b6xBL0BuZ5S4cHnqo4
 4kZhv6fXd+hJh5DWNtw2uz6ThIYRVUbqs5HvQjV+FzfukcZL4hiOjunPb9V+V/ZG3J97
 1X/bew/4eMxQ4QGpRAusGM39sdI5WckN1W5E2DHKWQZM1zSSaH4ZA3164o6eQKtrN1WT
 bX+7PbQcO6aPvRIywARTrkUMLIaoYiUxO5q8lSu6JezfUORs0gr8T5PFaoks9P/qT/Vp
 +DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDw4VV2ffMQG3yt5Zv/YbUVKu4oDT8jkTF9gh1DDSJA=;
 b=NH3OMIcRcM/G4Be5h1XUfXBcJTTegE12WJPkiHMuqWphiMTwVbirzJTSzkO+yh6k43
 V0MwLjrNjT8kL3V5PdHZy1dNokqogP2cJNZx5Gw3XLeKszMiWlGE6dTCOmYl7PsMi2Cn
 yRYMTht8nxw+ovaOLlkMy/ius5jP+lL4JCyvZgdWaQitPRXTbSDFg1Vkl6yKpagKk5eQ
 hvQxrwOVr63bypyt37w6vXZGLqH2SOrU0htua9lnTt07ZDnoRsmqKHfQgMz65BgQzym6
 axBhWC3qPGwhSXw8nQwjSaQ5YRVrDmnVS78sulX69ooAPEVojIfjFHN3hJ80uZycoiMs
 YeeA==
X-Gm-Message-State: ANhLgQ37b3VbpKs7lpG0b2A4AdArChKA9azUenVl+XwvxRIHjotUwgAR
 eGafMSpxbDeu8h9Xlp3Qqgx9s5vRR6I=
X-Google-Smtp-Source: ADFU+vunJQrMUv6vH3qc7rs3w/NwZbgHyO7w7i/2GPJBoGh+NdvoyEdrQOjLbNtaxLgJC0J8bDEg0A==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr17008019pjp.108.1584228846947; 
 Sat, 14 Mar 2020 16:34:06 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r64sm15647109pjb.15.2020.03.14.16.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:34:06 -0700 (PDT)
Subject: Re: [PATCH v5 45/60] target/riscv: vector wideing integer reduction
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-46-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5586a9a0-a068-d51a-4a2c-1a779d6b85cc@linaro.org>
Date: Sat, 14 Mar 2020 16:34:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-46-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sat, 14 Mar 2020 23:34:10 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  7 +++++++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  4 ++++
>  target/riscv/vector_helper.c            | 11 +++++++++++
>  4 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


