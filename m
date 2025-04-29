Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A3C369DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 14:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9m22-0000if-4F; Tue, 29 Apr 2025 10:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u9m1r-0000W3-9l
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 10:33:49 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u9m1n-0003eN-8M
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 10:33:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-aee773df955so5979214a12.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745937221; x=1746542021; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lCvd/jEvoH4uS8fiQaq7q1KoXJTfiBIxoFTatV/aPGA=;
 b=md/3MkBgXjivZIA/lIkZmZB2YlgAumDBGgqcwAqWMgJ23xVlAVII8Ze+kD0dQitgzo
 lQDg+T90IPZiy9Eud+p+zhrnlBTLj87e9gayvwfoBcpT51maLgmV5jCWDHBJ2ilu8DEU
 /JXO+ckvUMi+GDKUzS5kqBAD989UTUV+tO8tT1LBZXiO6Fp3iDUIb4HeAMkFY+jH2UZI
 61YJ7lYNR56PQY7n8sJJLviG46do+FXv/myCFoW1KSODILtLKVkatT1byl/oXvJIM9aO
 UbyShyZgF3fwrGI11RDoLJfQGMpSb9bZUIfXU3WnUgiDSbLQ6rQjFeMHwWH6GAhk1aiK
 Iaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937221; x=1746542021;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lCvd/jEvoH4uS8fiQaq7q1KoXJTfiBIxoFTatV/aPGA=;
 b=ofAzk/mFqjcPYyXPPyoKfCeo6QIcB4gvFSZ+mWKPzFPJC4JzaZF2ctTfGPIBtBdXGs
 RhBi0ub6bpd1cmr3So4EvIXnm7BD0DRwGzQU1Wbliw7qMAorEp3n/zQcEz/iTeWPYJ3G
 NmyEDMhOUJ/UZxpE5UzDa+IvZFNEOuj95UIzW0w1zq/UoSFzpMlqsxeo0Xekqfrjbd0J
 svO7wW8O14PfutTrxEN7CA/yE++ekdwfSPVXhXYFR443baz7M7gzCUroAGL74ACaMv97
 IYhxqEMFCKEUzeaNRorsrlRSmyP9igRG9COoFcXN5HFcJ88+1WkSTtjIeoo0oWz6MOyq
 Ymsg==
X-Gm-Message-State: AOJu0Yyg+Fu1mQyJ+6gn7bPwqsTtFTR4MKJeY7X5CJTa9Jepzc6WHOuz
 ZIlCbPaDsOldN0WLDEeXjuobSzKwaRmJ3HD7MTRC4vn5SUD//QMWFgvZgQoXP0SqYGtKBhVNA6i
 4
X-Gm-Gg: ASbGncu1xWUn4GKtqeEk2mcEjcmZH9VI0/ix/GCMC9rOxE7qxoqINL/un4/ny5y4KtU
 WRPPAHCMFx/phxkO/WDBSAP8mVwJAyMyKggNAK66m52Cxd12faSmh7FmMSEwBrDoDvJAJyM7mIe
 DgxT4gNcIXa9bUqoFI9uKnqkOTq54cj/uuPKKnhVO+B6hiWhSJ81P0GHxtkDPAjGoOTqzyfIzBF
 7CE+o7lvz2br3dPUwTs2OS81jE6BUArdQ2E3yZ5YHW1ACtA3Ux7sPnFePFNwkd0eXx7XTOhobd5
 FnUJ09W1Ht1dxzoQNHAAAUW46Ytvv0fvjcKDgDQzCxyiV+3hJx7yAJ63TU+1pioPyPLXnXVt2PW
 V4wJWWY0=
X-Google-Smtp-Source: AGHT+IEx49tIljXSY/B7J5gw1YeaezdqeGO9k44bFknnMMilR55hKzD+EYhBLaNLCYuHaAKyjjblJQ==
X-Received: by 2002:a17:902:e551:b0:21f:40de:ae4e with SMTP id
 d9443c01a7336-22de6bff5b3mr43769385ad.9.1745937221103; 
 Tue, 29 Apr 2025 07:33:41 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4dbe375sm102905495ad.96.2025.04.29.07.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 07:33:40 -0700 (PDT)
Message-ID: <5b298186-50c8-4473-8eaf-d0bc6f6793ce@linaro.org>
Date: Tue, 29 Apr 2025 07:33:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] target/riscv: Fix write_misa vs aligned next_pc
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-8-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250425152311.804338-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 4/25/25 08:23, Richard Henderson wrote:
> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> +    /* Suppress 'C' if next instruction is not aligned. */
> +    if ((val & RVC) && (get_next_pc(env, ra) & ~3) != 0) {

Bah.  I preserved a second bug here: not "& ~3" but "& 3".


r~

