Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYBSi-0003K0-4O
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 12:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYBSg-0003Hb-NI
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 12:39:26 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYBSf-0001ld-Er
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 12:39:26 -0400
Received: by mail-pg1-x543.google.com with SMTP id r22so3211682pga.12
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ReaqC1vUYuLUY6DMS8He004r5qrLKP3LM3/d98FNdc8=;
 b=pnazu1loHKhJ1qOneM0Ui+NYFSYk9rJrQdg48G0e8wpTdWPHtVk0kSzOCMHNKcHelw
 qJcTi93a+wv+LwAcOMreU+NRgr+LhUZVBN9nEY/gSh8WFAfnH68E+rLXSO0VVRkX4Uqf
 b0CPgo515tmaROGvIk6YNnCRJRkeQ1mhpQkOSWLFscIiCL9u2W+wfqi0p6/oNU0lEEkt
 MvUjUHsgdsneYqIdBFbADkWpJblq2ouX8ueXMlIsjBeuhEBfKlbBpZK2E8bRLClwLATK
 YCQRH0UHmfU3pf8zaCsrmvjtGs5i6rNeJMM5oZxUD8bmmVwvwQfVnAI4pavo/1+woSQ2
 sRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReaqC1vUYuLUY6DMS8He004r5qrLKP3LM3/d98FNdc8=;
 b=SPDoxsjgmEdLrWZ5WquVXUav3daIm80kYvhYYK9ke6ti93R6Y/zH6jho03nf+zWfQs
 mT/oG+YkLGRDx9ala3XxdokWtVsb1gnZbrvkmn70Xsxk5QLn9R5r9E/Xx2N/rz34tH96
 LoY4i8N+ZTx6wYpX1bNyGOQB19njc/Max/YAnWXQlWLechE4Z3510t2D7M1PLs/ehw85
 Ea3uctOVKwUzy+icZtEzQTL2r2UMlX2RbQQesTJazFWyBtPBpF5hkR7le7Ilq0AdS506
 /nFO8YDtHMFr2ASKv96t9FDcXnz6Q97asXzj1CyBG6+B5XiLTKiUv+nK27JdrEaGq/fb
 q3Uw==
X-Gm-Message-State: AGi0PuZn/vFBU3GGIfFkt1TUByHMFTt+qzoBPttblj7aBRj1DcTsgyE+
 2FMSaGEg26OGdXOvGaPibzfEhf/f4q0=
X-Google-Smtp-Source: APiQypJWwcEMyTcIxEcRqjeNMyyEPInkZrrkUaDi//wFNhOznULesSvemxTQswItfoI+7jGReiCD+g==
X-Received: by 2002:a63:f555:: with SMTP id e21mr15290639pgk.254.1589215160827; 
 Mon, 11 May 2020 09:39:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id n69sm10109792pjc.8.2020.05.11.09.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 09:39:20 -0700 (PDT)
Subject: Re: [RFC PATCH 1/8] riscv: Add RV64I instructions description
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb866cde-b8c1-f722-d364-1ae015bb277d@linaro.org>
Date: Mon, 11 May 2020 09:39:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
X-List-Received-Date: Mon, 11 May 2020 16:39:27 -0000

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> +LUI RISCV imm:20 rd:5 0110111 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 }

I think it would be helpful to add a function for this.  e.g. greg($rd) and
gbase($rs1) (including $0).  It would keep the constraints smaller, and avoid
mistakes.

These functions would go into risugen_riscv.pm.

> +ADDI RISCV imm:12 rs1:5 000 rd:5 0010011 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }

Since all of sp, gp, tp are not in risu's control, why is rs1 only excluding
sp, and not gp and tp as well?


r~

