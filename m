Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAdUp-0006Mo-Qr
	for mharc-qemu-riscv@gnu.org; Sat, 07 Mar 2020 12:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jAdUn-0006Mb-Ra
 for qemu-riscv@nongnu.org; Sat, 07 Mar 2020 12:44:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jAdUm-0000JY-L6
 for qemu-riscv@nongnu.org; Sat, 07 Mar 2020 12:44:17 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jAdUm-0000IN-ES
 for qemu-riscv@nongnu.org; Sat, 07 Mar 2020 12:44:16 -0500
Received: by mail-pf1-x441.google.com with SMTP id f5so2743006pfk.9
 for <qemu-riscv@nongnu.org>; Sat, 07 Mar 2020 09:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=95OZDX63l38IDOcVyZsmX82oiPYU78nsEnv9BrPfj+w=;
 b=HTat6H2joNOKsKRXW3If4etMx+SoBwmSpq1YJFq0xo4RcAS8SsllYs9qiR84rWWfjp
 fbMbJ1lntK7CBIR3+v8fp4U81VmC8hTVh+V0g0QSClhAwbXguUthNfxwQFfkp1UUvy8O
 7RBVSfATGau4BCyOdNbOhqufRP47lGc8kpLqjl0lBRVkHpMkFCZm3c1mEMzllVEgGKiQ
 LHhzt2vMqQSfKpKEVY5FZq4DlDU6a2SxMQsgpNRg6Jby27mhyru4+HShaY8xBv7T+jNj
 l3KntayFSIRSCMn8HszTUdkLCC907aCi/mI2rmOWjn2fFyH9JJouctt8H9ICbGR0nR8M
 megQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=95OZDX63l38IDOcVyZsmX82oiPYU78nsEnv9BrPfj+w=;
 b=iVlG4vqb/Bol8ZGciv9U5Anh5f83EadHOA/C3dJoI77peKWlTXj/HGV+yy4Fa2KhnY
 41IV6VCYtiMzSa38S5LxWcvxnpCG4a0ADrmrgffcrde4mkDdr35tQK68JIZ7SybSQWxB
 1WUFmfzT2dYw0nsSqrBz9gERmmF5hoZuPZLor4RWPRSG0LWlzlK8iA4ZoQB/PbmQU1DE
 8rQ2bK5q0lHgprx9SDTjYi0vzyjwQC5UGvec2EWr4Mu/Zr3bVKx/4owzzVe9KAZD26K/
 KVtCB3SVBYFIbaDLjjYYq3/3oABmRoZJpoPTh+2ssLAnzx1eXBMONWI5sCP0YASo1Na1
 xUuQ==
X-Gm-Message-State: ANhLgQ27Z+TvfYQKu5M8n5Zgx0nm38aE0tO/9z6XDht9Dmrdsv2m5bTo
 6CtaFZbzjPw813Ko8EHTZlsBDV8efRg=
X-Google-Smtp-Source: ADFU+vsBV9LrfSZQ3f3gwO6m+vqnYHrm/8s4GUrwu9bbzDrxcUJzH4U6cI54goghGGWs732183djbg==
X-Received: by 2002:a63:309:: with SMTP id 9mr8722586pgd.193.1583603054737;
 Sat, 07 Mar 2020 09:44:14 -0800 (PST)
Received: from ?IPv6:2601:1c0:6100:5580:6886:21be:91dd:78be?
 ([2601:1c0:6100:5580:6886:21be:91dd:78be])
 by smtp.gmail.com with ESMTPSA id u13sm13229747pjn.29.2020.03.07.09.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2020 09:44:14 -0800 (PST)
Subject: Re: [PATCH v4 1/5] target/riscv: add vector unit stride load and
 store instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-2-zhiwei_liu@c-sky.com>
 <4cfb56d6-34a5-0e35-87a0-2aefaafa4221@linaro.org>
 <a225d9e7-f7ee-71c4-db90-cc27f25470ed@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4253d616-3d28-c848-d559-86407e4fc313@linaro.org>
Date: Sat, 7 Mar 2020 09:44:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a225d9e7-f7ee-71c4-db90-cc27f25470ed@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sat, 07 Mar 2020 17:44:18 -0000

On 3/6/20 8:36 PM, LIU Zhiwei wrote:
> I define fields shared between vector helpers and decode code.
> FIELD(VDATA, MLEN, 0, 8)
> FIELD(VDATA, VM, 8, 1)
> FIELD(VDATA, LMUL, 9, 2)
> FIELD(VDATA, NF， 11， 4）
> 
> But I can't find a  good place to place the fields. There is not a
> "translate.h" in target/riscv.
>  Is cpu.h OK？

Perhaps "internals.h" would be better.  About 4 of the targets have one of
these.  It keeps things that are not relevant to the actual architecture, only
to the implementation, separate.

r~

