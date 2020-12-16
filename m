Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbam-00083W-Qk
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbad-00081s-GK
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:32:00 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbaa-0001eh-LB
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:31:55 -0500
Received: by mail-oi1-x236.google.com with SMTP id l207so28642610oib.4
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSVAhYm8P85HjTQTQdKL+xjPYH2kCnjgdjH7F+F6lTw=;
 b=Fj+Ot5MtK2SZsfivSXD2QaIs1k8AdkBox7C6l4kU1jqbHXyP/O6RAstTZdkIcjN8LT
 Olfx3d/WjY0fXW72m+g2RFx8uGdrDmsYFiAVi/NU2UlVmuArcnhIF2w476RP1B8Sg8mF
 MFIaDbnfBMWkLgBy+QPmlpzdtOYZnGYxmcsN+KK/fcQiZDE+BLqw4qrpKD8EyicmLSyR
 zprIOzbNY1kXCyzf5O70FQYx5uKzQdIfjeshuT4c4EnXiQT32ZY4329LBXLWdFWGILMU
 NuT7i8VSMTAWuAGp+0Jq76TgnSiXHYVDwISHQdQOYraytRdOSP1IQdSks1tSPlJLZoSC
 BHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSVAhYm8P85HjTQTQdKL+xjPYH2kCnjgdjH7F+F6lTw=;
 b=GswgfvOezAqPyZypue8IgbVeBVRW8NrrnuwrzTVz1ZqMgrNOTPLXL7wAKPJa6RCbpd
 uDQCtZe1OKU/xuzfTvgAbxW6nu/YysszDHJI1AGqNHozLUqWnB06HzptJZ23B2xyL9fs
 4wptXNnu5uA71c6kE2KMxi4Z3fLSo69TKrGAaWyklY4XtfApBE6+6SclBHLrZ7f59RaZ
 0q9h2WT4C+vND84FxZLWKMW2LUY2tjbe8aRZwSoh4S23N9rN2SI0BIWqPa7PEZD/DPJr
 k4eeGFcIoCRdDE84zZjgWpu7pEjv+Fmb4c8oRQ8tIuYVAl5y185clqBrFQC8Kj8Bm+tN
 W8fw==
X-Gm-Message-State: AOAM5334YRoaX2Ac9i1lIJPQQl/CcCjwlepXflM/8eDwpRex5/ivRqE4
 Pk4PYvs6RTw6gEFPWvAIc33k6Q==
X-Google-Smtp-Source: ABdhPJzBmRbep9t7vkoaGOAC+QfmQAwaVuehE4sJo8vYHCvinvshmPga6SVnIH3kYR3RpJ5+rQ0uxw==
X-Received: by 2002:aca:c4c2:: with SMTP id u185mr2627946oif.177.1608143511715; 
 Wed, 16 Dec 2020 10:31:51 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s23sm725583oot.0.2020.12.16.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:31:51 -0800 (PST)
Subject: Re: [RFC v2 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-16-frank.chang@sifive.com>
 <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bbf77c9-4346-a603-a8c7-7b2d3127b246@linaro.org>
Date: Wed, 16 Dec 2020 12:31:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 18:32:01 -0000

On 12/16/20 3:14 AM, Kito Cheng wrote:
> Hi Alistair, Frank:
> 
> Should we add the bext_spec option like Vector-ext? I would suggest
> adding one to align the behavior between V and B.
> But I have no strong opinion for this.
> 

I don't think there's any point in that.  The experimental extension will be
updated without backward compatibility until it reaches 1.0.  After which we
could add one, *if* we expected there to be future incompatible changes.


r~

