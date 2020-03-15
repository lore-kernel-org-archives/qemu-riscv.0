Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDNnK-0007cy-CM
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 03:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNnH-0007cG-RP
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNnG-0000og-MH
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:34:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDNnG-0000iS-GY
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:34:42 -0400
Received: by mail-pg1-x542.google.com with SMTP id b22so1709015pgb.6
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UcVIDaZFTGg8yD62yteC6TS+hauFRwqPFO8BBLmGTuU=;
 b=eOUB3kik56bFncRNsgORN/9sDXwAs8MZqUzZD7SX1pI9vkBAJBOFvICaYs7JJnNCsS
 LRcr9ht75Uar2qy7nXjEG9YIGmBmz5DEuSDrnK63T1Y6SzwUs6WLJUgiV9A+hVcH5b7M
 tT0MsMFqZ3saI0XT8P4Os3v1+bOdqF9MewTlrjDCRXnUtT0IowAMHVn4HYktbkLEQ0DR
 MCzTq21WkCIZGap6zWOMinqfWfue/hXPUhisrnV3lygHF4zoBjAeUd+591eazucce1w1
 qqjqLOeR1jUz6LXohqvkq492msUIiQ6/qBcEoaY8ENFx2Q2rJ+LyJGp/Ed8X24HV/5W5
 Rzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UcVIDaZFTGg8yD62yteC6TS+hauFRwqPFO8BBLmGTuU=;
 b=VbLuSwZmBWAkPeJtC8sZomv2r5JpZ8ICmD8na+x5/KxPWUmd7YAEjFg1LSJpfVbr/K
 hiODK0EOl/J7ybOEItXvqP9MVlsnA+yl6LW/sGZymJzxMI4AbgegOwNFp/6SN++ZbZVV
 lZuf+2U4KIhP16U4Q2sMukDZKSBEpktmBXWRijFtrVtsX6a0SBwT0VRQEXULRL6vjeJG
 Rlmwuru2lLo8xS44eYRfXij+1i2g6n+8KNY5gAc6IbafauA0eprUXh0piRGfTgcnKhDW
 NQBCHfYSCLShBSOdXsvIOa6DFYR3drmtyuE1puL939l6uI+nMabJ85FDfp0ZBXyR2rMT
 zWpw==
X-Gm-Message-State: ANhLgQ0aVpzArFKDV8EXymDGf/cKHjO9g6Hvki/IiNuJW1G/9A1gs4Rp
 0qOA6LVjcs32ja5NWhtE9I77N5y0kOc=
X-Google-Smtp-Source: ADFU+vs7Wrmbcy3Dcuc30/sZV5nyyNA7J4WjfdVsXLc3jthRJjMIXcJbkhlpl4NGYlVdGywq+8BikA==
X-Received: by 2002:a62:2ad0:: with SMTP id q199mr23343148pfq.48.1584257681050; 
 Sun, 15 Mar 2020 00:34:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 19sm23983161pgx.63.2020.03.15.00.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 00:34:40 -0700 (PDT)
Subject: Re: [PATCH v5 59/60] target/riscv: vector compress instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7b6a820-1ca9-f895-4599-f306d4ceaae1@linaro.org>
Date: Sun, 15 Mar 2020 00:34:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Sun, 15 Mar 2020 07:34:45 -0000

[ The patch didn't make it to the list, so reviewing

https://github.com/romanheros/qemu/commit/f46b8c8bbbf0acd78746a49fe712306d7c05c7e6
]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

