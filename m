Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbHRo-00084H-FE
	for mharc-qemu-riscv@gnu.org; Wed, 20 May 2020 01:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbHRm-000840-Kn
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 01:39:18 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbHRl-00061m-M1
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 01:39:18 -0400
Received: by mail-pg1-x543.google.com with SMTP id t11so928040pgg.2
 for <qemu-riscv@nongnu.org>; Tue, 19 May 2020 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FInLJZsz7DTqWcGwjBxLaRbWeRV5xABJxDSojaES5KY=;
 b=oPw5xPkA2TMKFp1prKUSo+rayv5WQx3+L/8acQ7kvJ5WzXKD9SiUs1AVcR6OD2S5Ud
 Ov0q8I7b285SO/yGTVTjQuDfFak13rE/1bBdUiHbAmojclT97yF5Uo+KpDitVsWVrxnR
 /FH700R5Wr34EtK5xw37Bs/AJPm4UPWPf7MMru995LOdEwUZa4oEhxWrk83fsYnJYqce
 mSAz+QYfwqVt64DXni6Z+STyluThihunrv1Y9xLy47VbRbmCroX6j+7B7EyRMuDAs6Pp
 bbwZH2r8Vh+cMUGJ2gjfqQ+yAbQY8CNh+kA5f4SoioYQSAk1LwGu4AqK5a9+ylyBZqbc
 PN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FInLJZsz7DTqWcGwjBxLaRbWeRV5xABJxDSojaES5KY=;
 b=KveZPKQ2aPqXrHjv2JhFds6GiZ/YWudS7B3GHPILyd6Plwo3RPlIvwXzMe924omdpK
 7mggG7ScNSeLylo1CgjSqf91AS9N/x/orLTTw/s5ksFTn92NFMwF13Id52dVNCzmAz6h
 eVS5VHHpJ3UT6gAW2AWLvyZenfysj8yDGwmudwG6S4Plo8tk1YBTl/HVAm4ugetf6G0j
 fwADs8C33AfPkqS5APe7rdic9k36hHbmVhvCHygBGa40KY572O1XF+GlTpWG1HDONGbI
 LdAlCQzLspaW0Hwu9h7xTSLMQyD9DwWq8gr89pkmINbpgmNd25dCPfgbgUVntHV20NPH
 X5zg==
X-Gm-Message-State: AOAM533md23zYLDzGQYwmqT8beJ3bgLleKIqAgQOVLTM6VnF+18NroJ3
 ywU/ZUS8BpxEcAW9e4SX6MnatZtCugw=
X-Google-Smtp-Source: ABdhPJwLb7sqsvqUu6Q29FaPEPim2OcgLc/9qs1KFVPeRYlOXneX5oVgn3PFdKu/9uRA8dXdMbxZeg==
X-Received: by 2002:aa7:955d:: with SMTP id w29mr2757768pfq.133.1589953155824; 
 Tue, 19 May 2020 22:39:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d4sm902663pgk.2.2020.05.19.22.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 22:39:15 -0700 (PDT)
Subject: Re: [RFC PATCH 1/8] riscv: Add RV64I instructions description
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-2-zhiwei_liu@c-sky.com>
 <eb866cde-b8c1-f722-d364-1ae015bb277d@linaro.org>
 <c776b7f2-ceda-4ab8-b006-698dd41fcc48@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f84427c-8978-0e36-f4e8-d498e15ead20@linaro.org>
Date: Tue, 19 May 2020 22:39:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c776b7f2-ceda-4ab8-b006-698dd41fcc48@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 20 May 2020 05:39:18 -0000

On 5/19/20 7:41 PM, LIU Zhiwei wrote:
>> Since all of sp, gp, tp are not in risu's control, why is rs1 only excluding
>> sp, and not gp and tp as well?
> When I test the patch set, I find gp and tp will be the same in slave and master，
> so they can be used as source register.

Ah, try again with different builds of risu, e.g. one with -O2 and one with
-O0.  I think you will find that these values are set by the linker for the image.


r~

