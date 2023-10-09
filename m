Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB0E95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:44:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qppcQ-0007na-GT; Mon, 09 Oct 2023 08:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qppcH-0007mS-Qp
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 08:44:12 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qppcB-0006PT-AJ
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 08:44:06 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0VtokhTr_1696855418; 
Received: from 30.221.98.57(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtokhTr_1696855418) by smtp.aliyun-inc.com;
 Mon, 09 Oct 2023 20:43:40 +0800
Message-ID: <8e8b6cef-efbf-42ac-975c-b523dc24a531@linux.alibaba.com>
Date: Mon, 9 Oct 2023 20:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] target/riscv: Use env_archcpu() in [check_]nanbox()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-3-philmd@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231009110239.66778-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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


On 2023/10/9 19:02, Philippe Mathieu-Daudé wrote:
> When CPUArchState* is available (here CPURISCVState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> RISCVCPU*). The QOM cast RISCV_CPU() macro will be slower
> when building with --enable-qom-cast-debug.
>
> Inspired-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

By the way, does the community has the plan to support heterogeneous 
architecture cpus in one soc?
If so, maybe we have to do this qom cast somewhere.

Zhiwei

> ---
>   target/riscv/internals.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b5f823c7ec..8239ae83cc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -87,7 +87,7 @@ enum {
>   static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>   {
>       /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (int32_t)f;
>       } else {
>           return f | MAKE_64BIT_MASK(32, 32);
> @@ -97,7 +97,7 @@ static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>   static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>   {
>       /* Disable NaN-boxing check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (uint32_t)f;
>       }
>   
> @@ -113,7 +113,7 @@ static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>   static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
>   {
>       /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (int16_t)f;
>       } else {
>           return f | MAKE_64BIT_MASK(16, 48);
> @@ -123,7 +123,7 @@ static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
>   static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>   {
>       /* Disable nanbox check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (uint16_t)f;
>       }
>   

