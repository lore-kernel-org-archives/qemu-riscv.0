Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pISHA-0006d5-DJ
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 05:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISH8-0006VE-8p
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:36:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISH5-0003PY-II
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:36:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id b5so1444705wrn.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLv/IeekQ6asy/TnS2KItaiEJBaORyeIW0DUoj6ybic=;
 b=PMOaDQTcJyuOsW1fy6NHvfCVkBM6NDX2OqxkAXifD+XBj5P5mMw0j73L9s/hSWOrq/
 xChQzBhlfgy8SV/IHq0zZiBBtg0Pqjw59ad76EQmsYivZrA7ysDE7Kz17UX6vUvrztOA
 524adC8cQYJPXli4Pnw9ZUXnVWNTuWIcmMoZaghjBgRWU1n2Wb/ck6unL46yjfp5vytC
 g9cGjSvPyWYA62JH8lKqGhFBqy2FYTL0ZR4cbtdhUM6fG7SYo9y75P0aUy8oZEu2oV8t
 ZjjfqCJzA9qIJ4QoLNTVdEL7GDjNQPUJZTYN2SmctQrXJEjxG89crYNqQJ52nOkntiQt
 xS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLv/IeekQ6asy/TnS2KItaiEJBaORyeIW0DUoj6ybic=;
 b=x+bwHVMaJg5MI6EQPv8/C63zWZr2UXE9pz03EraEK3gjC6VUHmr4UVRFqlCV8Tm2zg
 iTOuUko6DOiGJ5R/vdiScrzHTU5F5LzHOSGFaoCrbdLW3dChfYPm8l+roPpK83mYXes4
 pv/BKMqbBsumhoDYzPLuE4935M244+u4IkQclu4git9v51/LwQ31WX0FE/03PvtSpHjz
 65JTTouAvfw5EiVREocd+xHdYZ0+vnybIp6r4rAuKmg0iv6Dv1S4YvYc6be0ZU7vcAoj
 8Y2hLv9zRHETrPlBrXeUSlEX4BiqqAaHncMwRCbuG+PJcxhYzy37QwWFkZxHDQ3cqmPq
 OT2w==
X-Gm-Message-State: AFqh2kpy6wqpkpxsAbJMbwwj1x8GTHDijZCb3oQgZTVvAMHPi9Jxlkj0
 WdlKowJP8ozPCMvRl31ahi7EtQ==
X-Google-Smtp-Source: AMrXdXtFypSGYgNvZkfv52EnL/CbCbQt0rylxbKNLuF/6wY/5JX5S2OF9yOn/+xXSP+NE9zgCVN1NA==
X-Received: by 2002:adf:ff8c:0:b0:277:2e27:61eb with SMTP id
 j12-20020adfff8c000000b002772e2761ebmr8645143wrr.24.1674124561943; 
 Thu, 19 Jan 2023 02:36:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020a5d4d41000000b002bdef155868sm13855613wru.106.2023.01.19.02.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:36:01 -0800 (PST)
Message-ID: <d6943d88-077b-a0ff-c9b9-4a224938f49a@linaro.org>
Date: Thu, 19 Jan 2023 11:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/19] net: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-12-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Thu, 19 Jan 2023 10:36:06 -0000

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   net/vmnet_int.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


