Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCvw-0003j3-VR
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvv-0003Ws-Lv
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:39:27 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvs-00036t-OB
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:39:27 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j3so5945255wms.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=DTxFRPXcb4SCyM3BKWwZ9I/mBqmVJ2p1/u6uTbsEpblXloYGrDz4ajswRUWzMLNV4y
 d6i8pVIRS6lmB4st7Kr3mQaXZdnS3WMwoG0+RE8Am/vCo8JxdeLsBQv9Zn+yrY9yRkfZ
 rNp2o8SqJ1n3CBseWCsJP7H3mYgt/4Kg+vzfhknd1r6e5codD/cTftQFlVzYb1rLn60t
 0iOxG+96EWZS++cCCSU2ZbxCtZ3JNp3gOfhHFhQ8NJjn63JhiURUK2NjGVzAtz69vy8l
 V2nPA/b7I34YgKM2WKZeG/nxWtG3+8sLNMG7iN4oJtnvnyKmom8H9+UioyFg3ZRIy7FK
 V7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=SXt827sEHCYWGHgDeS7x18wkIbwI+zPWXZ/r6mwZKCSL5xIFSjbL6zWFztVwXRnaaO
 DauvFZH+7Ug/0jcTE96QZ3QZ0lWgZvVUu/VJ83n/HuvyUIIZe8nrn0i9J+1bX1nDM0z+
 OljHSjcNoomvkblFFW6vXKyng8v47mcEtoriO+MlH6oww+TNcECcfALshnPius/5xfbT
 PwmBhT5Dg8kPPQvLgbalbpBNDfA4XuIdv89ibrowhqZx5Gr8Z7PfICM7JnChicMXgl+M
 bKY8isbBPQxry+yGowNHJa8mx5zZYY5m3ZNn+OO3UT/wqYul1OL8QvJd7WRDSyjnQGeG
 f25g==
X-Gm-Message-State: AO0yUKUCQEw6TKn6ZAjfuCvCY0svNyaQrgEGk3qo2xOrgNk16jEL5PuE
 gWcXuELuxQMmTeSwJSEPidfLuA==
X-Google-Smtp-Source: AK7set8/OodzGNJTsy63o8faeEs5uo449LqjKZLGVZm4wpOATIr/4N8u5hM+qnFU9OsFIY92tNBPvQ==
X-Received: by 2002:a05:600c:3c9d:b0:3eb:598d:6494 with SMTP id
 bg29-20020a05600c3c9d00b003eb598d6494mr10401598wmb.16.1678117163444; 
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q30-20020a05600c331e00b003dc5b59ed7asm10362405wmp.11.2023.03.06.07.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Message-ID: <f8e7b83a-f8da-d2ca-022f-033a960a26d7@linaro.org>
Date: Mon, 6 Mar 2023 16:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 59/70] target/tricore: Use setcondi instead of explicit
 allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-60-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-60-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 06 Mar 2023 15:39:28 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> This removes the only use of temp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



