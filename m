Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKdp-0003EN-U4
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiKdo-0003A0-4d
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:28:52 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiKdn-0004Ro-2X
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:28:51 -0400
Received: by mail-pf1-x443.google.com with SMTP id s23so7443783pfh.7
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rYy5eOQuMS4YMmSiYyf+dGqlj27SP/QwdDa6BIyhIUE=;
 b=OUOrI6dN6zfWDjbdzWWO8ZeeT1cirjw00WhGszRqTcxyDwKk4Z4/BiWrI7njjKGn1Z
 x5Jwb6aFhBMIfqoV8P+/MoBUSFeaym7v42/Wyg6/xDO+RD5Mp3TIxQB+NsHFHYoDehh1
 q4Z6C+m6s4Bi8XKPjtiJlDj+J8QMljMN8fuE3fNypFHABXTixzKsGVdBxI+O9+V6IPwR
 tnf//2qkumB+MtZu5FjAIkWhhH+5+R6qD26Jdw52+DVyt/H3ae9yV1kxsTIpfD/U0Lma
 6Q4yLzyhMLZSxwqC8f07JlMRMwnn5KARHEPkr2Dve/XWIOzVWnq4pa/wLkLPHl5d8u19
 qq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYy5eOQuMS4YMmSiYyf+dGqlj27SP/QwdDa6BIyhIUE=;
 b=uepr+nrjl6vTn4ef1EExWtYHwUnVY8ZLmlgPQWQ2dtF4PMJD8QDcqsLbzbHFLp+BuT
 QS95cs0W3bO9iGoLxgMZ27fHSSWPe4qkgRTCIstnxpiYmI0pSvYmqgVGSjIm4CgMvLgG
 XABoPN21OKumQs4/cyg5m0JEUexNTHI3oyGZCX1u3XtojaKGWAObyag5GrM7EymU2Q8y
 nle8FKIZDr5seWB6uiXhHxmHi1si5t5ZmYx4UqVq/IeVDT3n0JMMSvdGRKCxdk3a6f9J
 C+WDEoCOwnCTJTbPkA0XnpFlAnY/Z9Gz04XHNHnujMz6YyIehRfCUav/NDRt0aIAM1Kb
 UXSg==
X-Gm-Message-State: AOAM532vIVCFKOiZBxJbgcGiLk27e4RuM6t6Kv3FdqPapsOdPzd0swSf
 WCPmA64ki5R8LmOxqtdUTmW+gg==
X-Google-Smtp-Source: ABdhPJzUf7mNux02QTHPdgNTuq4jhyENABeWpCQFcG3Ze1876F5rPZw3FRJYAsybpiv5Z+g0GhkLfA==
X-Received: by 2002:a05:6a00:807:: with SMTP id
 m7mr22672954pfk.246.1591633729593; 
 Mon, 08 Jun 2020 09:28:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id r20sm2117904pfc.101.2020.06.08.09.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:28:48 -0700 (PDT)
Subject: Re: [PATCH v8 30/62] target/riscv: Update fp_status when float
 rounding mode changes
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-31-zhiwei_liu@c-sky.com>
 <7cb2aa5d-833a-8544-dadc-5aabba06ecd2@linaro.org>
 <ca1e71cd-c290-5fb9-e9bf-026c73e06560@c-sky.com>
 <7ec3d397-bf9a-07f5-3014-4acf47a4fd6e@linaro.org>
 <ba7ef161-8bc6-516f-b5a7-8133e3a89998@c-sky.com>
 <dd721c20-fc04-49b8-0c5a-1b4761105461@linaro.org>
 <8b1d3fb0-479a-9fa9-99cd-b71e0da275cc@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27bc5d40-e213-da95-43ad-be082e30eac3@linaro.org>
Date: Mon, 8 Jun 2020 09:28:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8b1d3fb0-479a-9fa9-99cd-b71e0da275cc@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Mon, 08 Jun 2020 16:28:52 -0000

On 6/7/20 7:39 PM, LIU Zhiwei wrote:
> Maybe I should only gen_set_rm(ctx, 7) for each vector float insn.
> And the csr write method for frm or fcsr will not change.
> 
> So I will remove this patch in the next patch set.

Sounds perfect, thanks.


r~


