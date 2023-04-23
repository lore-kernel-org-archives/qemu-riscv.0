Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqex7-0000CH-0u
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 15:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqews-0008Ub-Qf
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewo-0004Lw-30
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so37804865e9.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276427; x=1684868427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hmvK9R9E09Fx6OSvVbAGm4GEl0DxBx1emhyImrOKsZI=;
 b=KTDR+JhrpvxrK8r0lzdey+EheYvaA4v69+tzGboeLsxwPfqWwMKh16EkM8Q9kSnJA4
 0Al57bx2cgiSDxfxxdBKRooMATTWatnHoZsE3axZ/wI+4TM3+Ra3K2b5UCBf3M4ixwJ6
 wAmBPxLki4koNi7LF4uC+Oh2h41TTJUqjutSTH3AruEpNlGU/bZvOJu4IWiJYFFtvmrE
 IWV7m/w+IuA+6AwO6ljy1wZXlN+zFxvM3dPOavAg0RA+2D62vB/rffv90VI6Li62jk+f
 uKHW6Bojo3Y2nXN9hynlAFIuP2kF3FHM0R+/H4S+qUJhn5qW6+bDY0HpnlNA6dsZkGAu
 /vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276427; x=1684868427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hmvK9R9E09Fx6OSvVbAGm4GEl0DxBx1emhyImrOKsZI=;
 b=aoxPZf+TWzEJ8GchZFbcd1jJ8jI1tM+NUGkkAwmpl+fnH+RM+wnas3KQsaDKdGBNTQ
 957Z3X8o5fPI00xqX/F8T3dLQsXkeBW5G8twviS/7Vt2h6E/TR0EJvUJNLVqr27z9A5k
 aExLMEf3XRnnRAJhpeeOVszTJQr/YN+EK2aY+9FYFY1L8nzMjF5M4ew0IGpQzG5T3Uwy
 GMzZDFgns0Bga+NCf+SIgvFiKzilrlrxeeFVVxTZybKBiUkrDAxAFwa9RzFsJlol4zDw
 rm8sXWKqc0x32y1PyBRyy8tpWkAkPL/9tPcel3DqIFuATIkaY723Rrj9uAXPQi8CX9jA
 CSgQ==
X-Gm-Message-State: AAQBX9cLQxtdQqQAlbKQtkuPwFr7TxbujF/glSv+++tuznZJQ706WOGa
 GsPSNZxLWMTb+csKq/NlFHvqGw==
X-Google-Smtp-Source: AKy350agFiv2tlYf3LvghBBNoWVIfxzEW9S/wV+wQoSaWvxZlHZ5rygXPsT54chUGT7e0Z+PO0t1qQ==
X-Received: by 2002:a7b:c3d2:0:b0:3f0:8034:f77e with SMTP id
 t18-20020a7bc3d2000000b003f08034f77emr6137048wmj.20.1682276426998; 
 Sun, 23 Apr 2023 12:00:26 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 i40-20020a05600c4b2800b003ee6aa4e6a9sm13572503wmp.5.2023.04.23.12.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:26 -0700 (PDT)
Message-ID: <16091804-4074-698a-3ee1-9c3ba09b6729@linaro.org>
Date: Sun, 23 Apr 2023 20:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 28/54] tcg/riscv: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 23 Apr 2023 19:00:45 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 68 +++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


