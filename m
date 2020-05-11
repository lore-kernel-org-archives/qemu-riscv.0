Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYCps-0001wE-H4
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 14:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCpr-0001tS-3S
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:07:27 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCpq-00042o-8i
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 14:07:26 -0400
Received: by mail-pl1-x641.google.com with SMTP id s20so4261080plp.6
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oAGh1ZXsQm99jnA/576mUtAvj+sISGxBOLGIFcGm+D8=;
 b=ppJ0S/tubQOlM41SEl/DLKk/cwCUAlPn1UyPzMQm3c3ZFblkV5MjHkm4lLIZdANjWz
 mbz9Ct1CQohK5ps7QTHuQeNA8JMft6CldQ/fVP5uGukHuiM2fCJgHSAM73arzscUflTm
 frWYNJN3abHu+0vISC4s5mEG9spWL8kuHVryAPXbEwQbUjZ3n27fHeZqgC+B0VKnlJNV
 yvKMbzxR3of0HCsxkMHq/Sg0zbfZuCjbsVc/zHayw/JcTgnXcGrCHwatV4hqqMQL+0Hu
 2eJxG+D9bWr+ayI4qeqL/wZ9IYYS0ecPkUtad8esgotYIJ2K9nSDu+WB4nEMz5eMU8Ft
 6cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oAGh1ZXsQm99jnA/576mUtAvj+sISGxBOLGIFcGm+D8=;
 b=CFrT9LHW0vuFF1Rjc8gCSlJPMnaeGA3c2f0BPYj+d+4v3dnjhtdGSzEz8cenMKDCtj
 2TEtW/5LFDNcs/FilG16DZ9NcAjyUy/vjTz/jMo7G285+zvq7Lovf+4YmeU3go+Lznvj
 A/mQ4NB6AJfM1WfZsY+RTb4ntHAWciT/xl/Vrgikojq8MawaZWGqSZbgSDACtlJ8Qq9y
 RQSUXHC69x3nhELBSVLSWCE0UoskOGoHnQmqsBC8kvvnr7dq1a2C4vYm8ajw50F3JCNJ
 qprHFVRifiHMm8gd8swWcdkm0kO6aTzzy4Y3e8W0wsaX8zjY8RSJQdZR4EWHWT8ewaUG
 Uj3w==
X-Gm-Message-State: AGi0PuZG7yZfVXenWzHebCOBRtyZcgp37FR6QQ98m+Uodc2iNPYmJ7rD
 7BY98lCwq3z7m8fiO2kgUpo4huuyNVU=
X-Google-Smtp-Source: APiQypKPlspg7AQrPyhEvi9fbYSw1e4SSI1S9zcSNeiKQtoDv+x/HHjqqKTTBcAgfo8thQaz0k3fBA==
X-Received: by 2002:a17:902:aa86:: with SMTP id
 d6mr16345891plr.87.1589220444260; 
 Mon, 11 May 2020 11:07:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a142sm9824046pfa.6.2020.05.11.11.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:07:23 -0700 (PDT)
Subject: Re: [RFC PATCH 4/8] riscv: Implement payload load interfaces
From: Richard Henderson <richard.henderson@linaro.org>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-5-zhiwei_liu@c-sky.com>
 <5a960977-eb88-1fc1-ae45-b10812777e04@linaro.org>
Message-ID: <8bb5eeee-fa86-4deb-ab67-53ea904d3b82@linaro.org>
Date: Mon, 11 May 2020 11:07:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5a960977-eb88-1fc1-ae45-b10812777e04@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Mon, 11 May 2020 18:07:27 -0000

On 5/11/20 11:03 AM, Richard Henderson wrote:
>> +        if (m->regs[i] != a->regs[i]) {
>> +            fprintf(f, "  X%-2d    : %016" PRIx64 " vs %016" PRIx64 "\n",
>> +                    i, m->regs[i], a->regs[i]);
>> +        }
> 
> riscv doesn't name its registers with an x.

Duh.  It does.  Nevermind this.


r~

