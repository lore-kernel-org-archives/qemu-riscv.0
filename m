Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F6CA0EE6
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:19:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uoUfo-0006vc-SB; Tue, 19 Aug 2025 18:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUfn-0006uY-5h
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:19:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUfl-0004sj-2y
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:19:18 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b47174beb13so4217345a12.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Aug 2025 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755641955; x=1756246755; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5hxrXAjf61iNW1Ll31DQuEb03MvcLYfvlT+/iSK8KA=;
 b=P1mi+VzZoskqqC75cMoLluC+eHenRsN6Q0S5GISQRaZ3YRiPZIctOfI5d/TUkcWZfj
 KHODlvR+v86Z6RQtWASvZ05f1ROlO66pUsrDFYDy8HYRov2VJAB/5WEhOXdUfV7h4Qv0
 drb9lbbSAK2v6C1TVZuE/iusOEBq+K4DChuhznfT318G+noKSNwSjGqsissPbIR9I/vS
 8zNe1ZKYdYrujaV4Cpg+L6TnBBQuwSJDznYT9tSoDmA07RUt+3ylllSDayBVkQA2i5WB
 Za30tsYH08YVDSbP9LotFHQB0tAwOKAuFpbJFaDtf+Tf7+atFiZAGEt/mQDrMnASaPkG
 bVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755641955; x=1756246755;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n5hxrXAjf61iNW1Ll31DQuEb03MvcLYfvlT+/iSK8KA=;
 b=TYXPyDrPOFBvgXJTxsu1hynVQqHY+UlF/jKqZ6LQ+xPAoXjkupt9/6wYmf0tpRZqpk
 xW/V5aqaI4AuOUqLSEeeVV+8+wag3sIsaoKAZFsXdlrty4lI+tadjpokJCv1sg90HqHC
 7MiplLwgKPdaK34ZhFmSedX6YnhIYNK+iwyVJwnfb4qp9eLpNCuoVqeE2v5uXVGHhtWQ
 1w8Z/xWt1G81IIHN/46BnKRHDEHd/3JNbjud+FYTF2/QDkEVYWsrV7ImkulraVAXiw6y
 ssXHsClihhEUvhuCVDzF1FW92qMo5R5qzIfhCMLJa90ry5T5atEQovN93vX4YjS9YPBr
 /7+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4zSbWUPosbMPlI50uubQviIVSlJEwOqRw6wmJaPpKujbC5BJvtAG2sHg7Q7g9xx7psh4h8K8fXQpp@nongnu.org
X-Gm-Message-State: AOJu0YxZe6rMbhDXvOJFWWYS1bRyRes54rIv23xF5ww5fLmwLsU/ae0n
 JRkeDnALm1fmiv9BShGeB5wLwoeDuSlQ1FO/Tjl9SWAcoOa03O6rB0k1YpwdMMSzmcM=
X-Gm-Gg: ASbGncuTnRm9RMAYFs4YiQ5OCYdPX9ryiwq3ly/1SVIXZHs+bXY8ASuCo7irlr7Avdr
 bZJUa4GGi2khvZhZ6Z2CXnYzfU+oQ/OnqYNbV8ALDemB8jmrh1a+xLGCq1eAc2AeMg6V+SEwR44
 otCRKEWJFNZHNpTwcQQf3qNVw5BTShXHZ9yp13s2psTEf5avL59Li2pAWmPsMIxSUGg8HMbkbRn
 hGl4irLSeIKI7qQthhgKItupD5IWnvUbzRakw0dagxUNtjo9TVUBVg8+wd0DmwviJaSTd0kXT+t
 6mtgfbxrpFk6XDEQcA8hgPhd6YoAt1LDaBz3x+eUb53w/BKy7Jdb89YhuvU/yB+fdGETVuqed1j
 1/UHgQ821PXclYOP+6z8b/9IPkwnT+kUKFA==
X-Google-Smtp-Source: AGHT+IEb8E1VqWUBJJgZFNZYPmcIhZjMlmLLtOvK9pLf8/m8D8vXmlH+qAFh+KFYh9lxoqwhbpkn9w==
X-Received: by 2002:a17:90b:51c1:b0:31e:beae:2934 with SMTP id
 98e67ed59e1d1-324e1423f88mr967743a91.18.1755641955176; 
 Tue, 19 Aug 2025 15:19:15 -0700 (PDT)
Received: from [10.0.0.90] ([120.159.20.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e258cb88sm211008a91.28.2025.08.19.15.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 15:19:14 -0700 (PDT)
Message-ID: <fa2566d9-0102-4de0-aa33-18154c623d56@linaro.org>
Date: Wed, 20 Aug 2025 08:19:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] tcg: Fork TCI for wasm backend
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1755623521.git.ktokunaga.mail@gmail.com>
 <630c91852939acf3c7fdd95c37b363fa5d4e60fd.1755623521.git.ktokunaga.mail@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <630c91852939acf3c7fdd95c37b363fa5d4e60fd.1755623521.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/20/25 04:21, Kohei Tokunaga wrote:
> The Wasm backend is implemented based on the forked TCI backend with
> utilizing the TCI interpreter to execute TBs.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

This is the wrong way to go about things.

Don't copy the tci backend and replace it piece by piece.
Start with a clean slate and add the pieces one at a time.


r~

