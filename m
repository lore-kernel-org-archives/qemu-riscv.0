Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j72zr-0004Xf-M5
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 15:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1j72zl-0004VJ-9l
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1j72zk-0003Ru-AO
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:09:25 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44583)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1j72zk-0003Lv-4c
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:09:24 -0500
Received: by mail-pf1-x444.google.com with SMTP id y5so310097pfb.11
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2020 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yyJNMLyrTyG3x116AuLrSuDe5q6fImd01Q5NIv53YPk=;
 b=ZqWSQ679yOiFiKrnknXVFrf33Pg/TulmzRwAvD6lmC1AT2rXyCo/1dOF9bZ+KSKmHe
 BAiS89w6dVuQjI9jwM4ajmzMOXIgSzX9OEHu+4feZDJDYLSUdktqsoIzLg7Yg+Mvnj8V
 Hun4LWLJZn0ab2Eh4CuPfAiDsiGVCHhgDnoX8X5CFQ5s9GOWRq5EqRSBR1LbCvx5LLF3
 aa6rBuRq+ZJR4ocRkSCGQxIKF+qI94BK1M9kXrPYJE4+HP27TZLZJACI1ie2Bbp9pgo7
 JI1+SQ8kXrOvFPTh/uooc7G04QZoNxPVd9ZrujF8q3LRthdBkccA52fb2NKiEEpawMce
 f2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yyJNMLyrTyG3x116AuLrSuDe5q6fImd01Q5NIv53YPk=;
 b=RVsQ+XXZhpIkNckvDWzOyT4IzdyLswkWB8dsQCamwi3Zd1SbhmXdgv30qP2sTUK3Aj
 zFXBaPqIhn9E3vDgZTP3cb+5ABykipbUQIY73ZvJomoz/K6UGdCMst3uiL1rNDdy6Wnm
 cJcfEW5qks25g+mF3HGZJ90k/xJA0wEhtjUxFRXAHfdsc2b2qJcjdSvt+bsUm5hko1Rd
 1hNteQYsALPJyc54YW+irbR6w7ztQnvNS62DUDBDkBbFqjL2zdvRjVH3A//PyT7LfIGt
 XPU+MgrWJdEgzH1iNRbncmx2AmB/CGkHW7d4L8glSVi05SS4VLO/1nR58+8w3CuhmEEW
 +vUg==
X-Gm-Message-State: APjAAAUxzdK7oEZu++DlrBuGgSDhjJSqi579eWX2R18lfYHwJ/IeSS6T
 2YJvlN+FM8lB1XT1/DkMJrt2KA==
X-Google-Smtp-Source: APXvYqwr4VOX3K3N87ePFT3LjDqtMkDqMtqA4FcnFkePcG6ossUeRtmCjH8TfSDQWq8NSHKFrUyC0Q==
X-Received: by 2002:a63:2b93:: with SMTP id r141mr511283pgr.306.1582747762481; 
 Wed, 26 Feb 2020 12:09:22 -0800 (PST)
Received: from [10.17.0.226] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id dw10sm3594375pjb.11.2020.02.26.12.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 12:09:22 -0800 (PST)
Subject: Re: [PATCH v5 0/4] target-riscv: support vector extension part 1
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, richard.henderson@linaro.org,
 alistair23@gmail.com, chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <ac290e38-bb39-6551-0758-95d087fa568c@sifive.com>
Date: Wed, 26 Feb 2020 12:09:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Wed, 26 Feb 2020 20:09:26 -0000

On 2/21/20 1:45 AM, LIU Zhiwei wrote:
> This is the first part of v5 patchset. The changelog of v5 is only coverd
> the part1.
> 
> Features:
>    * support specification riscv-v-spec-0.7.1.

I'm still concerned about versioning issues.  This implements an 
unofficial draft of the proposed RISC-V vector extension.  This draft is 
not compatible with the current draft, and will be even less compatible 
with the final official version of the vector spec.

The patch adds a version which is good, but there is only one check when 
qemu starts.  Probably something like 25% of these patches will be wrong 
for the official vector extension.  How are we going to handle this when 
someone submits patches for the official support?  It would be better if 
everything in these patches were conditional on the version number.  It 
might also be better if we stopped calling this the 'v' extension and 
maybe used another name like Xrvv071 to make it clear that it is an 
unofficial draft of the proposed vector spec.  Or maybe be we can use 
v0p7 but that isn't an officially supported extension name.

If this rvv 0.7.1 implementation is considered a temporary solution, 
maybe we can just remove all of this work when the official rvv spec if 
available?  But presumably it is better if we can have both this 
implementation and the official one, which means everything needs to be 
conditional or tied to an Xsomething extension name instead of the V 
extension name.

Jim

