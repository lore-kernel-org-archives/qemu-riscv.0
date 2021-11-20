Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moYwv-0000xf-GD
	for mharc-qemu-riscv@gnu.org; Sat, 20 Nov 2021 17:35:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYwu-0000xE-73
 for qemu-riscv@nongnu.org; Sat, 20 Nov 2021 17:35:08 -0500
Received: from [2a00:1450:4864:20::32c] (port=56188
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYws-0007nT-3u
 for qemu-riscv@nongnu.org; Sat, 20 Nov 2021 17:35:07 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p18so11755399wmq.5
 for <qemu-riscv@nongnu.org>; Sat, 20 Nov 2021 14:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZWbr/2vHaYihnisCiK784wK+kh1ViJ+MF6oPCR2LCTc=;
 b=f1mVsmY5OYP/F62iust/NMGTttBM3eP0ZDnjXzXtREruqqsvubz02kgcJZht2wIAci
 Ge2SBn4jJbSG5InjaRWUTZivlDr5d6ATHzBYBCf1s6rGRWxikkjwD/0JM+De7aBUOgt4
 VsK7ICs7nsGPR1nkq7gpnoeeNAVID9YtyVDtzoELBOUwRUCaL/s+wL2McHJskPEuQMqY
 QqVETKz72XcMnkJ2tAjpNqaLx7+5HLfl+PRjK7vcNAp/qnsj4SxpyAs2a8md2/OEgyLO
 j04crzZcZ4aqAUZpRiAki/VNdzb/sU68FPg52fikixaAjb3v43mw2XsOETHo0NKSLryY
 Pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWbr/2vHaYihnisCiK784wK+kh1ViJ+MF6oPCR2LCTc=;
 b=BIEK9jc3AS3nbkqehhvVltDP+m6Mk7AApnCa0SjXZ+XYCBnZB1JJxLcy06t/RL8r64
 7Zk8t7xmyytRW/RiXQtnMJlcBAxb874eYo+oFzsrPIyL0EiR74UewrDvYpNhqsEtme0i
 rx1Wrq54qFYLita0Bunw/RQaoH9xPYFVQwdhGe0r0SfuVv1z4Pdj9VNogFQ/PSZMMUoL
 75syRccXEn/sucQCEF1RpbVkmh8+mf+tJdLmZt8JdUyPESE1n6qErEn8Fx6QpjOm7ZeM
 EkXgSbTH8EUhuYGV9cSFmfckbNhEDqUVJonHULWSN2tdm5KRiua+YF0O6p+w9xc0/D/m
 dYxA==
X-Gm-Message-State: AOAM532olIOGIj9522KGr2H5bZp0CSFtTOLos9APuFdjSsXB6m18jHqc
 t6zlT2y1GQg+Y/10ELKgJRZErg==
X-Google-Smtp-Source: ABdhPJwRaQiQ7RXrZpegKeHAzKoEB8Nbx6W7mi/oskytctQ90BSY+lj2elUyY6KHWz6A1a5kzPQh+g==
X-Received: by 2002:a1c:a5c7:: with SMTP id
 o190mr14686120wme.186.1637447704301; 
 Sat, 20 Nov 2021 14:35:04 -0800 (PST)
Received: from [192.168.8.101] (77.red-88-31-131.dynamicip.rima-tde.net.
 [88.31.131.77])
 by smtp.gmail.com with ESMTPSA id f15sm5165544wmg.30.2021.11.20.14.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 14:35:03 -0800 (PST)
Subject: Re: [PATCH v1 12/12] target/riscv: Support virtual time context
 synchronization
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair.Francis@wdc.com, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, palmer@dabbelt.com, fanliang@huawei.com,
 wu.wubin@huawei.com
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-13-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9c9196a-692c-cbcf-339b-8e84ecde7cee@linaro.org>
Date: Sat, 20 Nov 2021 23:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211120074644.729-13-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Nov 2021 22:35:08 -0000

On 11/20/21 8:46 AM, Yifei Jiang wrote:
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
>       .version_id = 3,
>       .minimum_version_id = 3,
> +    .post_load = cpu_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -211,6 +221,10 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT64(env.mtohost, RISCVCPU),
>           VMSTATE_UINT64(env.timecmp, RISCVCPU),
>   
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
>           VMSTATE_END_OF_LIST()
>       },

Can't alter VMStateDescription.fields without bumping version.

If this is really kvm-only state, consider placing it into a subsection.  But I worry 
about kvm-only state because ideally we'd be able to migrate between tcg and kvm (if only 
for debugging).


r~

