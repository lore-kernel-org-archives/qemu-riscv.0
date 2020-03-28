Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHytt-00005B-Uz
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 20:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHytr-0008V1-4z
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHytp-0005af-QR
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:00:30 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35437)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHytp-0005YY-JI
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:00:29 -0400
Received: by mail-pl1-x643.google.com with SMTP id c12so1229502plz.2
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 17:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OIVlgF2aOTZVzVjS7x77/prtT7TLJr1WO0porHWWGV0=;
 b=ZLaEBIVHhJ5tkeGo1EkwTv45k1YpYTSXts9pvq/1gvMqnOr0318qoddEOMaqaPi8Yy
 8AdUn/7KjpBPKsWE9+hHQsZfq1B9GmwlTvhj6nK8RAoELgZ+YnOJrpm14l866wMlVHvp
 SbXwgXYJnRoSLcYUv2KBjWAMXBNRxr6bmXD5rfH1EZkm1wdqR7domO91shRmCxiLxqQp
 7V+9smZGpyZRkoi8bKUN178UkjjY6zKPbR4YW2bDl7Yy1jcyev9QJMotuPTTdJ3B6YcM
 O3eGTKXv+2VFI+1FrC9aCgZkqzmJKqxoCrlzEnhe/THWCrV0LymYv+t+tQU4yxv6Bkj2
 47GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIVlgF2aOTZVzVjS7x77/prtT7TLJr1WO0porHWWGV0=;
 b=ZDdgcfhvNUjwG6nAFi3n+d71WKSkUVVyLPhMwga1SOSt7Q29GFrSRTPXqrouu3dMr6
 BHHfhvET4WaJMfIdjXAjoQuLOcwjzZw8saWQkWb8xfs/6MUwGr3AGNwvnVpJ/wGwfVn9
 Gaa9rNXkWcnrmw3vro5wDq3T2D8StlxK+b47Nn9jGVzdLLFGSgR7X0f8gGAvGWcxsKee
 BPBCZRw2CHo0s0YgTIban9VpvN6o+GfIGGmYZzwIT9v77tuE+HE9tO+A9mvSexeNSCEj
 HgMRAfbR3L5Y8KW2iFJqhW7QVdixxrZgK9Siytob+zul1E0gNOj7Mi98tTNOttMbBg7J
 hj+Q==
X-Gm-Message-State: ANhLgQ1O/+zpu97alN+k+l2UL6LZA50EWXOQfv20u7GmzSmoN6hIQm/i
 f7TJdrA/iyGkLlVL2/9pXbwNEkYOHIA=
X-Google-Smtp-Source: ADFU+vummvhKYdnybCJrjAJIKkKp+b7+xixV+p428jehjedJle9+SyPRm+Hn4DlHMuOWR72OvAuOvQ==
X-Received: by 2002:a17:90b:4c84:: with SMTP id
 my4mr2010002pjb.3.1585353628166; 
 Fri, 27 Mar 2020 17:00:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id y15sm4859058pfc.206.2020.03.27.17.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 17:00:27 -0700 (PDT)
Subject: Re: [PATCH v6 12/61] target/riscv: vector integer add-with-carry /
 subtract-with-borrow instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8050c7c5-8d8e-a622-60a3-9c9ee0caab82@linaro.org>
Date: Fri, 27 Mar 2020 17:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Sat, 28 Mar 2020 00:00:32 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  33 ++++++
>  target/riscv/insn32.decode              |  11 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  78 +++++++++++++
>  target/riscv/vector_helper.c            | 148 ++++++++++++++++++++++++
>  4 files changed, 270 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


