Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGRAE-0004Jr-5n
	for mharc-qemu-riscv@gnu.org; Mon, 23 Mar 2020 13:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGRAB-0004HC-I7
 for qemu-riscv@nongnu.org; Mon, 23 Mar 2020 13:47:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGRAA-0007nf-B7
 for qemu-riscv@nongnu.org; Mon, 23 Mar 2020 13:46:59 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGRAA-0007mi-0O
 for qemu-riscv@nongnu.org; Mon, 23 Mar 2020 13:46:58 -0400
Received: by mail-pl1-x643.google.com with SMTP id g18so6233863plq.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Mar 2020 10:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cMdRFwPLdBBqdclOU1y4YXPpVW8UyO6JkyPnTNFzx4s=;
 b=XnnpKquo/U8iHf9JcdF6Le2PhpR0jSp5iBgyjeDo24Hxo/IDd8eZ82lNa8+DrGmFuc
 S2ZBCsZy0yqJAh7lyhMvjg439RSd95R8SADjNnu5J6swpDfvSg529FSBRTmrF13MB4r2
 D+9co0cgGh9IVIa42vlzWJXdS2xMxQZGaZS0SXdrQ2yls+WGaCqy7+NWN4c9OAaDpPvu
 vUMWEzEnqaFFzlyimtmuAq5fVG1LXSSTvzougyrEhGsUdJct6Mqtv5o+ca2CR6ErwSt4
 Qati1S+w6O28DgyiDSlW11HmhSXYEnPl7ptWhj21QWxnsG1fe9Ea7No0Y6i0nr/E6OWo
 ZGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cMdRFwPLdBBqdclOU1y4YXPpVW8UyO6JkyPnTNFzx4s=;
 b=RCxWGKKcI+dSu30tE1EFU/Th2LJ0ygPPL8hMtOm2DQaRcZ+h70yvVBKDzBsUV89wBV
 e8fU8HVKjN+pZySOdrVLhh7q9gKbxvD4LE3QwMdPIyMbEqnOHSMc9enx2fNdHt5X4dyF
 n5PebwInhCp4gSEXgGtduVttlIIuxC5XRAO5BnDL/Rm4RZnmBH3nrhVXt3MvPq39w90f
 j1DKp6qg5n8oT8hHckzkYRKoZGq6MDGfKmWN9u0HgTGPfIG8qz/b202k35yyAXVP31Q3
 0Rgl5DlAg71EmjWBTNSN0800dsUuRNJDTDJ+fAuBU/91YCKdUWBRvwPrnUKZ21yhIbHp
 neTA==
X-Gm-Message-State: ANhLgQ0gq1cjtF5PdSBazvB6XJ43ew2vNHOrszWqU2IX680qEs3X7Ev4
 /SzX+cvekACUqmwsg6Ln+XlmwX2eld8=
X-Google-Smtp-Source: ADFU+vvgtoXB0RsoDuY/KJ2O3Nt7k/PCssRJGf4lg0CrDwnEPeteVbeU5E3NTZPYlALmObz+8S16Tg==
X-Received: by 2002:a17:902:463:: with SMTP id
 90mr23970281ple.213.1584985616485; 
 Mon, 23 Mar 2020 10:46:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 nh4sm190696pjb.35.2020.03.23.10.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 10:46:55 -0700 (PDT)
Subject: Re: [PATCH v5 09/60] target/riscv: vector single-width integer add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-10-zhiwei_liu@c-sky.com>
 <49490839-077a-5bb6-c56e-95298c5ef74f@linaro.org>
 <f742e1d1-05ba-f051-a2bb-d8da15e7e947@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cda82320-f0c3-7fd7-1731-ecd251ae0904@linaro.org>
Date: Mon, 23 Mar 2020 10:46:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f742e1d1-05ba-f051-a2bb-d8da15e7e947@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 23 Mar 2020 17:47:00 -0000

On 3/23/20 1:10 AM, LIU Zhiwei wrote:
>> static void gen_gvec_rsubi(unsigned vece, uint32_t dofs,
>>     uint32_t aofs, int64_t c,
>>     uint32_t oprsz, uint32_t maxsz)
>> {
>>     tcg_debug_assert(vece <= MO_64);
>>     tcg_gen_gvec_2i(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
>> }
> Hi Richard,
> 
> When I try to add GVEC IR rsubs，I find it is some difficult to keep it
> separate from tcg-runtime-gvec.c.
> 
> The .fno functions, e.g.,  gen_helper_gvec_rsubs8  need to be defined like
> 
>     void HELPER(gvec_subs8)(void *d, void *a, uint64_t b, uint32_t desc)
> 
>     {
> 
>         intptr_t oprsz = simd_oprsz(desc);
> 
>         vec8 vecb = (vec8)DUP16(b);
> 
>         intptr_t i;
> 
>         for (i = 0; i < oprsz; i += sizeof(vec8)) {
> 
>             *(vec8 *)(d + i) = vecb - *(vec8 *)(a + i);
> 
>         }
> 
>         clear_high(d, oprsz, desc);
> 
>     }
> 
>    
> The vec8 and DUP are defined in tcg-runtime-gvec.c. 

Update your branch -- they're gone since commit 0a83e43a9ee6.
Just use normal integer types.


r~

