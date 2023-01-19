Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pISHn-0007x4-LK
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 05:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISHi-0007v9-Jc
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:36:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISHg-0003TV-As
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 05:36:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id l8so1135446wms.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+FM7cXimnUn4oH5URYtU7uJViNTMtrQeAopCdTP+M=;
 b=QoqxjrPCt4AFW4X71P1UMzTxpSgHGH5DyI/tNSaxNlpxnNQBmDlNTw/VMjR6Llm9+Z
 HSmRzqvrMAadjAwcW5JBGMgpxEaPI97bxlqkyBBnVhsJe6RuLV5iLzL2mos7QQ/ShQYI
 3IUJLR33t3WBjAVwxxEFt2J2TqeqC0a1XD5Fl7k1Hs/FRPLf0+zla+W8RSTgdT2WjHZQ
 uOZ/l++9ajlTFdlszV/6qhudRS1v1Wg2aX+fmG2169pl6JJh3gD3OGy85QRrExUwbchd
 LzwTUo4LQPLiaGQXrbqjX0K8Q/sleSALDmIrJQT+n8v6Gow4YMYIpD86mBdFI3e+PbkX
 P8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+FM7cXimnUn4oH5URYtU7uJViNTMtrQeAopCdTP+M=;
 b=47nRTvyWvqkp35EOGoiKaXkf2JIhHwDrp06ntkOa3b/kD3o9u4jxK5vKc/x1eif8Iu
 mpaDAhOvT1IkbifYpY4XI/u7Mmv9UCaG5K+jYIBW7yBzvHV7Bm6+aU/SK9m/jFG6Te1W
 mWnjauhZNZzs1dmR1LIM5+/oigDmSAnV3/yFitrtTvB6K01D1iL69O4ykg1BhT2TrWF6
 GUKPBKK7QXdK8Jajve8PU7xwznY2+/bGqSFgqTO1sIb9sK5KqrlSH3/QN/122vBxKeWY
 h1zbFpIRuX/ma8GD7P8HU53SehSQ6gr3QEWvDmwburOM+F+F1lS9TTLRPY7FoP1RGQaO
 RxPA==
X-Gm-Message-State: AFqh2kqTnszrDUSa5K3mF2l7hVMXXhNqhKxBGl1BVxdpb3FPCHc5mazO
 OL5Qo+u+55UsMrX/npmNfBy2qw==
X-Google-Smtp-Source: AMrXdXunwtsJQmy23xAE56w1+4exQZSAFt3W2AbxS8kdNcAyJukB46lFDGKV6nSkQfMZ0y8vabEw5w==
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr9476856wmb.0.1674124598398; 
 Thu, 19 Jan 2023 02:36:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003c21ba7d7d6sm1030996wmo.44.2023.01.19.02.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:36:37 -0800 (PST)
Message-ID: <823c1832-b165-f3a3-75a6-ff8de387dbb0@linaro.org>
Date: Thu, 19 Jan 2023 11:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 15/19] accel: Clean up includes
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
 <20230119065959.3104012-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-16-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 10:36:45 -0000

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/sysemu/accel-blocker.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


