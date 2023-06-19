Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57339EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 13:19:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBEmf-0005Sz-67; Mon, 19 Jun 2023 09:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEmd-0005S0-2E
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:19:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEma-0005gj-3v
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:19:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f9002a1a9bso32560645e9.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687180737; x=1689772737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kV5ocU7i0KBGnZGeOM1hIpbYTuDSpqrAyFJP5fIGdWg=;
 b=VQ2o8C/62rZ+PSvaRUUcTnQytF8XhwI1mD72WU55YycNSpZkOOWu6hUxCamALw+uC+
 lvgX055QCubK8zxFzBzQPALx4A9k3UJsbQR6y01/j8dY/f6DxnxZMsVjGFkAIuutd6o5
 GFfZ3LTITNmYahqqbjzZt5nKfgTjTcvv/5QVGwfYmRO67hxLgNrRShnL6/6ayV/wwhDV
 oonEoWfZVT+olmkZIdcconT74i/1N9yErMQUD+So7MX5deYky0l9JrCFTqT4F98N+CfE
 hTNyGA/pKETax5BcPfMrGVCWpScI4yFpinrdVQBHtSv6zvCiJNBVOJKolL+KTO4i3+t/
 OTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180737; x=1689772737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kV5ocU7i0KBGnZGeOM1hIpbYTuDSpqrAyFJP5fIGdWg=;
 b=hiD1fXyt2Y5A+S/KLn44rlsmykmCthXe1l0hL5dB+VMuNrjKYR/IE3tvnqYqN5LUKo
 v9g53wdwnw2HvPifehKLbz1yeLJ4w0dyMsAeRwie8eatxHV8PWbxTUwbZNrDltrWC/li
 dQ8n5idSIW83bPdNxXjK5u3T0XHrMcwdJElCgRayFjJZvEnlQ2DOzYq+YhhNwkCWfhUf
 e18OmQMLjJ/Ohe9V6oNPqkUMizQBkU0ZXw/gHxXonQaOKePMSzkrYc5jcAlU+cY+bnJg
 R0qOvTGSsu1C5i8zwUMNer+Lzq/GUuptMmPNgAUe+ZpyYdFqlHhRW45FJoALs0ufHAyh
 53kg==
X-Gm-Message-State: AC+VfDxGDeXoTprbQv8wKBpngPaiCIK363FkwNQUoOooVLK3ZDTEBoid
 gclKG3i9NmNX7LRkLUsG4Jo3JQ==
X-Google-Smtp-Source: ACHHUZ5t8XCL6v5bUKq+A7VqQ2L4oEYtqH1jnVikSCikwclwT2gVkoxpqwJlHeeslqY/Y21nE05sAA==
X-Received: by 2002:a7b:c342:0:b0:3f4:d18f:b2fb with SMTP id
 l2-20020a7bc342000000b003f4d18fb2fbmr9447164wmj.8.1687180737358; 
 Mon, 19 Jun 2023 06:18:57 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 l5-20020a1ced05000000b003f70a7b4537sm10722393wmh.36.2023.06.19.06.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:18:56 -0700 (PDT)
Message-ID: <1515598d-0de5-6114-efa6-963bec310e6f@linaro.org>
Date: Mon, 19 Jun 2023 15:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 35/38] crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/6/23 04:23, Richard Henderson wrote:
> These arrays are no longer used outside of aes.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h | 25 -------------------------
>   crypto/aes.c         | 33 +++++++++++++++++++++------------
>   2 files changed, 21 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


