Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1Xqy-0008IS-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 11 Feb 2020 10:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Xqv-0008GF-PR
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:53:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Xqu-00032F-DJ
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:53:33 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1Xqu-000318-6K
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 10:53:32 -0500
Received: by mail-pg1-x544.google.com with SMTP id g3so5921539pgs.11
 for <qemu-riscv@nongnu.org>; Tue, 11 Feb 2020 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9lFy3+MRR7TYYly5eGGTBavGK2tFmldkiIzr326jGWQ=;
 b=czqUf3QM3gjnueyJNa0yGj3Iw49keeCxC2H+pHMxhlJ83KMMtbB8uVvrctrDHX5nbN
 onSactF5wakAyH0HbT0j0ao5CHSxv5Pa/frwy457R3PIXA3wH8dH6XXwe1Av1BsIreFu
 9kXkYWUt/w7Eb+8RAS0S86lf0mzdPh8vR5AZqxh1BpKxKlUZ5hsgqnJPMJg0DMR9iYjl
 rZ/TinAZLblY+88ULd+9Re46+doBzhpfiGnu/y6yPh4YlchvIrr2tP/efyHggbGsWD0z
 1YpTRcY0F4o72jkVDyLUdIhGe70vNAGVeo+u86qc2m1g5xIML4yAvC4fQiMDEsdG79AZ
 nX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9lFy3+MRR7TYYly5eGGTBavGK2tFmldkiIzr326jGWQ=;
 b=Z3/5fgHQlytE/ha4jc7Ynmujs6HlSNsyxPVBJWfCliM0MrMpWp3tO6njxhmDZqvJoa
 kwOUohl8GROp2+JkE8FY4jSlIbyR/0hsudoj47fkp3UZXAwvmtDijH97OAqhjC+x6In3
 Wrq5FTmzN/XnrplorGrf2f6+xIHEey2Snp5h3SG0a6PXZR5gGrX8VGb9Bk6uIuanoi2e
 BTi4/Rn+KSZ3YaCOOCuu3a8kMmz2i789tG/CRNn/2MPC4qUlWm2VKB60cdZNs33IJxuj
 AXBLFq+IE2RTPj007rZB7MOPm/BHM8RAYDRvG2O0uZLLAtwQp7jjjwkzyDI4bSCTVTlW
 pqjQ==
X-Gm-Message-State: APjAAAXv4JYTbAgYZ27/EUV5mDzXemYWSa1vEEzjBtShroRF2RRwhrgg
 3IYM1QVWGMUY3ta289znih5n0SCgTmU=
X-Google-Smtp-Source: APXvYqxGoKYN75yWZb6ileXm0lw3EqYrHtO7FrYohtsNpyoeyvWVXYPr3DFXCOt7IQv3N8HbLijkzA==
X-Received: by 2002:a62:342:: with SMTP id 63mr3830595pfd.19.1581436410470;
 Tue, 11 Feb 2020 07:53:30 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f18sm4582819pgn.2.2020.02.11.07.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 07:53:29 -0800 (PST)
Subject: Re: [PATCH v4 1/4] target/riscv: add vector extension field in
 CPURISCVState
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc4d0b93-013f-5cf5-4ff4-248ab99eec70@linaro.org>
Date: Tue, 11 Feb 2020 07:53:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210081240.11481-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Tue, 11 Feb 2020 15:53:34 -0000

On 2/10/20 8:12 AM, LIU Zhiwei wrote:
> The 32 vector registers will be viewed as a continuous memory block.
> It avoids the convension between element index and (regno,offset).
> Thus elements can be directly accessed by offset from the first vector
> base address.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I still don't think you need to put stuff into a sub-structure.  These register
names are unique in the manual, and not subdivided there.


r~

