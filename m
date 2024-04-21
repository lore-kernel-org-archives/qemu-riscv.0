Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C9C4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 16:46:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryaK4-0002UV-AL; Sun, 21 Apr 2024 12:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaK2-0002TA-R0
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:45:46 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaK0-000221-4f
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:45:46 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6eddff25e4eso3017523b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Apr 2024 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713717942; x=1714322742; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XqloDR6JsK2Iw2I3SwNxtQ6VQIK+ro3QdjLtZn15xnY=;
 b=ucelI2qlVfVwRZLUD0Byp/cNRgiapvn5AnnaZBRD/fZl9oiVgWBrtWvPzurLQDwaDA
 qXlwItf6bCO4E89FVFui3/vOQNWb5N3ifYI2lhD/lAZtXGkXP+RqxtsZE9+iSUQAMXE6
 75LwVtK1aYid18i9EikcUHOJc4LbFZfv+Z2MGNYbykdxRHmMHnfn2GZDcawoCSYS5uZa
 rVa7WcA9g421Z6sPkKa5de3B+hzOGUWjT+xCO/DtSGpCU2scEzIdXIG2ubaXcXhZyft0
 z0+k4dM/0kTKolRH8CYkw5yP75DkG3OumHAPHdOTup72ahwIwuYY3N4jYbqRCNKdHNOJ
 nkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713717942; x=1714322742;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XqloDR6JsK2Iw2I3SwNxtQ6VQIK+ro3QdjLtZn15xnY=;
 b=s7yLIUAJFbz8DdYuF86cgFwFJX1kHqOnfzQAMZeugFFQGL8rBFSXhmWmL/VZbNJRyy
 4HvnD8ennE/Z1TEzcnRMOp4Fl7sYlEnmCA7uutH+fTxUX3NwiI0RGqiLSgQAARTxlMOk
 bCxqb9dXBeCoZ39vUUGVfdF65fi9Ltz3Bi7tl1JeEhJ9jCEEuDBngd5pvY3jDxj1gEC9
 FzQ9HSG5E0JvyKrxzW2tl10mdwH2qPjK7bn6hyh07FBa8v5st8WpsN867dIEKiNI5zSi
 IIZy/N0qtxWtX2c8xAWsUMnBTwY9xJXh9R/+UTo8UT5Ajz+Ndxf522ZK0YDRc36mwXdX
 fn4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDNRQcQ+WooE7bAr6OH9yehBOpef0kclKznysD1TkHaMLN+/ZM+EJbZEPboDkMko3NKVjTK4sOUAXs0xlxiZoZn7Edh4A=
X-Gm-Message-State: AOJu0Yxg5a6MB00UH8VUKPtVjvHe0lX+PGPaFzAMcZsjBLqAjL225A43
 ZmTLy2DWkyopiHrRhnWoCEn/Jy3jTnOuN788lRuA8FQ1AA8hdcQs+ctxKfxwN3Y=
X-Google-Smtp-Source: AGHT+IG6DOXZP/ObKsKG/7I0+KifVXQujh5NZwrjVmUfh5wYhRDh1Vw+q/zI/eLtf3WOZ29XNLocaA==
X-Received: by 2002:a05:6a00:3cc3:b0:6ec:e733:c66f with SMTP id
 ln3-20020a056a003cc300b006ece733c66fmr10587194pfb.0.1713717942623; 
 Sun, 21 Apr 2024 09:45:42 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a056a0014d600b006e6c0895b95sm6342357pfu.7.2024.04.21.09.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 09:45:42 -0700 (PDT)
Message-ID: <ce2b8954-9560-4de6-aa2a-0dbcb6fc7469@linaro.org>
Date: Sun, 21 Apr 2024 09:45:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] plugins: Include missing 'qemu/bitmap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "qemu/plugin.h" uses DECLARE_BITMAP(), which is
> declared in "qemu/bitmap.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/plugin.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

