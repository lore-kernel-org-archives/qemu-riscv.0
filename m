Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poaep-0003vH-Np
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poaek-0003un-9W; Mon, 17 Apr 2023 22:01:19 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poaeh-0000Qe-2A; Mon, 17 Apr 2023 22:01:17 -0400
Received: by mail-vs1-xe33.google.com with SMTP id x20so3198781vss.0;
 Mon, 17 Apr 2023 19:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681783273; x=1684375273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIJb23MJUE2rsYlXnSyjwSk9JEWHyPHGcilb2JCrNjs=;
 b=r3LR5N2f4b32xMe7esJoxA32RergUGeqSGO30z0nitI+FqkCo8dyNAwgJiv3zC+UQA
 1Ki3khT+5ZbtYqJU5F1KfslUuGJcnqoqSOy/utU0fVZ9TBxydKU/Q544jtX2MBM/df0o
 WptepIinjhKBYH4lVFbPxau1OlL5riTf0iWI5LPpLdMo+3a5N+Jd7wVjFbrzDzPv4s8G
 S0N73kt7XRoUKRcuW8P1nFpYM3R4FBmlWnokE180C07rYnzl4Q0FOJ4UVN7JzV32pub8
 NIxCibEB/pSLkl7AyMKgtVeMZNZFVIwCB2TKoCuiZoaxnWTS8E8qapb+Uv3SkFKpWmrF
 12qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681783273; x=1684375273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIJb23MJUE2rsYlXnSyjwSk9JEWHyPHGcilb2JCrNjs=;
 b=Y88GBDwV+VNJG8NSLDn6eXjc7z+5S7uZN0D8hWctuhHevDWFYgeKIg+5m/GYDJAXjc
 uv9tM3QbkpwTMILNBghwmnOuhXtTS1eDnfZVw6mit6NF3gZ5qkNjpjOkOVEyef3M6Hee
 nxTS0RbomMhyaHeReX5tHbNLaLHfcL1NvBBAVvUV5rW++NroOfKLeRKo4BEIYd7RJrtZ
 yqRR7yDnV5iZXGn8DdbQVz5wdGFRMmQhCvpPmPKowDIPmaobFzYzWCohNgTatrtN220I
 9yPk6R3FgMOwDv1u1XEg3I9bRSmbkPOM017dKbC1iHRng96hnd3BkrdVrLLfcAzP+zog
 IT2A==
X-Gm-Message-State: AAQBX9eMXAz4VK+jgK3edjpVhLrE06Q8X7e9wTFBpFut9JLbY5Lmx2zT
 MAY+EG6ghFNzzNz57eFTQLSkxPpvP2Yvg7rBweo=
X-Google-Smtp-Source: AKy350YKnEreWOgi6b5V6gV6KpWHsjwMOSjHMXlB3Q+O2uw3L3CCt8I0e6qbo2a21/i7Yl7RAwi7O4auwmH2ox5XT4w=
X-Received: by 2002:a05:6102:394:b0:426:ddc3:5bce with SMTP id
 m20-20020a056102039400b00426ddc35bcemr5031396vsq.33.1681783272992; Mon, 17
 Apr 2023 19:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230416232050.4094820-1-dfustini@baylibre.com>
 <20230416232050.4094820-4-dfustini@baylibre.com>
In-Reply-To: <20230416232050.4094820-4-dfustini@baylibre.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:00:46 +1000
Message-ID: <CAKmqyKPj8BRmGRtrFQiMw6PoutbZy2mHLRS5tFFs6Lx8x2ob3w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] hw/riscv: implement CBQRI capacity controller
To: Drew Fustini <dfustini@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Nicolas Pitre <npitre@baylibre.com>, Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 02:01:19 -0000

On Mon, Apr 17, 2023 at 10:57=E2=80=AFAM Drew Fustini <dfustini@baylibre.co=
m> wrote:
>
> From: Nicolas Pitre <npitre@baylibre.com>
>
> Implement a capacity controller according to the Capacity and Bandwidth
> QoS Register Interface (CBQRI) which supports these capabilities:
>
>   - Number of access types: 2 (code and data)
>   - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
>   - Event IDs supported: None, Occupancy
>   - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID
>
> Link: https://github.com/riscv-non-isa/riscv-cmqri/blob/main/riscv-cbqri.=
pdf
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  hw/riscv/cbqri_capacity.c | 532 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 532 insertions(+)
>  create mode 100644 hw/riscv/cbqri_capacity.c
>
> diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
> new file mode 100644
> index 000000000000..a9f65c2ba25f
> --- /dev/null
> +++ b/hw/riscv/cbqri_capacity.c
> @@ -0,0 +1,532 @@
> +/*
> + * RISC-V Capacity and Bandwidth QoS Register Interface
> + * URL: https://github.com/riscv-non-isa/riscv-cbqri
> + *
> + * Copyright (c) 2023 BayLibre SAS
> + *
> + * This file contains the Capacity-controller QoS Register Interface.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/bitmap.h"
> +#include "hw/sysbus.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/cbqri.h"
> +
> +/* Encodings of `AT` field */
> +enum {
> +    CC_AT_DATA =3D 0,
> +    CC_AT_CODE =3D 1,
> +};
> +
> +/* Capabilities */
> +REG64(CC_CAPABILITIES, 0);
> +FIELD(CC_CAPABILITIES, VER, 0, 8);
> +FIELD(CC_CAPABILITIES, VER_MINOR, 0, 4);
> +FIELD(CC_CAPABILITIES, VER_MAJOR, 4, 4);
> +FIELD(CC_CAPABILITIES, NCBLKS, 8, 16);
> +FIELD(CC_CAPABILITIES, FRCID, 24, 1);
> +
> +/* Usage monitoring control */
> +REG64(CC_MON_CTL, 8);
> +FIELD(CC_MON_CTL, OP, 0, 5);
> +FIELD(CC_MON_CTL, AT, 5, 3);
> +FIELD(CC_MON_CTL, MCID, 8, 12);
> +FIELD(CC_MON_CTL, EVT_ID, 20, 8);
> +FIELD(CC_MON_CTL, ATV, 28, 1);
> +FIELD(CC_MON_CTL, STATUS, 32, 7);
> +FIELD(CC_MON_CTL, BUSY, 39, 1);
> +
> +/* Usage monitoring operations */
> +enum {
> +    CC_MON_OP_CONFIG_EVENT =3D 1,
> +    CC_MON_OP_READ_COUNTER =3D 2,
> +};
> +
> +/* Usage monitoring event ID */
> +enum {
> +    CC_EVT_ID_None =3D 0,
> +    CC_EVT_ID_Occupancy =3D 1,
> +};
> +
> +/* CC_MON_CTL.STATUS field encodings */
> +enum {
> +    CC_MON_CTL_STATUS_SUCCESS =3D 1,
> +    CC_MON_CTL_STATUS_INVAL_OP =3D 2,
> +    CC_MON_CTL_STATUS_INVAL_MCID =3D 3,
> +    CC_MON_CTL_STATUS_INVAL_EVT_ID =3D 4,
> +    CC_MON_CTL_STATUS_INVAL_AT =3D 5,
> +};
> +
> +/* Monitoring counter value */
> +REG64(CC_MON_CTR_VAL, 16);
> +FIELD(CC_MON_CTR_VAL, CTR, 0, 63);
> +FIELD(CC_MON_CTR_VAL, INVALID, 63, 1);
> +
> +/* Capacity allocation control */
> +REG64(CC_ALLOC_CTL, 24);
> +FIELD(CC_ALLOC_CTL, OP, 0, 5);
> +FIELD(CC_ALLOC_CTL, AT, 5, 3);
> +FIELD(CC_ALLOC_CTL, RCID, 8, 12);
> +FIELD(CC_ALLOC_CTL, STATUS, 32, 7);
> +FIELD(CC_ALLOC_CTL, BUSY, 39, 1);
> +
> +/* Capacity allocation operations */
> +enum {
> +    CC_ALLOC_OP_CONFIG_LIMIT =3D 1,
> +    CC_ALLOC_OP_READ_LIMIT =3D 2,
> +    CC_ALLOC_OP_FLUSH_RCID =3D 3,
> +};
> +
> +/* CC_ALLOC_CTL.STATUS field encodings */
> +enum {
> +    CC_ALLOC_STATUS_SUCCESS =3D 1,
> +    CC_ALLOC_STATUS_INVAL_OP =3D 2,
> +    CC_ALLOC_STATUS_INVAL_RCID =3D 3,
> +    CC_ALLOC_STATUS_INVAL_AT =3D 4,
> +    CC_ALLOC_STATUS_INVAL_BLKMASK =3D 5,
> +};
> +
> +REG64(CC_BLOCK_MASK, 32);
> +
> +
> +typedef struct MonitorCounter {
> +    uint64_t ctr_val;
> +    int at;
> +    int evt_id;
> +    bool active;
> +} MonitorCounter;
> +
> +typedef struct RiscvCbqriCapacityState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +    const char *name;
> +    const RiscvCbqriCapacityCaps *caps;
> +
> +    /* cached value of some registers */
> +    uint64_t cc_mon_ctl;
> +    uint64_t cc_mon_ctr_val;
> +    uint64_t cc_alloc_ctl;
> +
> +    /* monitoring counters */
> +    MonitorCounter *mon_counters;
> +
> +    /* allocation blockmasks (1st one is the CC_BLOCK_MASK register) */
> +    uint64_t *alloc_blockmasks;
> +} RiscvCbqriCapacityState;
> +
> +#define TYPE_RISCV_CBQRI_CC "riscv.cbqri.capacity"
> +
> +#define RISCV_CBQRI_CC(obj) \
> +    OBJECT_CHECK(RiscvCbqriCapacityState, (obj), TYPE_RISCV_CBQRI_CC)

You probably want this in a header file so that it can be included in
machines later

Alistair

> +
> +static uint64_t *get_blockmask_location(RiscvCbqriCapacityState *cc,
> +                                        uint32_t rcid, uint32_t at)
> +{
> +    /*
> +     * All blockmasks are contiguous to simplify allocation.
> +     * The first one is used to hold the CC_BLOCK_MASK register content,
> +     * followed by respective blockmasks for each AT per RCID.
> +     * Each blockmask is made of one or more uint64_t "slots".
> +     */
> +    unsigned int nb_ats =3D 0;
> +    nb_ats +=3D !!cc->caps->supports_at_data;
> +    nb_ats +=3D !!cc->caps->supports_at_code;
> +    nb_ats =3D MAX(nb_ats, 1);
> +    assert(at < nb_ats);
> +
> +    unsigned int blockmask_slots =3D (cc->caps->ncblks + 63) / 64;
> +    unsigned int blockmask_offset =3D blockmask_slots * (1 + rcid * nb_a=
ts + at);
> +
> +    return cc->alloc_blockmasks + blockmask_offset;
> +}
> +
> +static uint32_t alloc_blockmask_config(RiscvCbqriCapacityState *cc,
> +                                       uint32_t rcid, uint32_t at,
> +                                       bool *busy)
> +{
> +    unsigned int blockmask_slots =3D (cc->caps->ncblks + 63) / 64;
> +
> +    if ((cc->caps->ncblks % 64) !=3D 0) {
> +        /* make sure provided mask isn't too large */
> +        uint64_t tail =3D cc->alloc_blockmasks[blockmask_slots - 1];
> +        if ((tail >> (cc->caps->ncblks % 64)) !=3D 0) {
> +            return CC_ALLOC_STATUS_INVAL_BLKMASK;
> +        }
> +    }
> +
> +    /* for now we only preserve the current CC_BLOCK_MASK register conte=
nt */
> +    memcpy(get_blockmask_location(cc, rcid, at),
> +           cc->alloc_blockmasks, blockmask_slots * 8);
> +    return CC_ALLOC_STATUS_SUCCESS;
> +}
> +
> +static uint32_t alloc_blockmask_read(RiscvCbqriCapacityState *cc,
> +                                     uint32_t rcid, uint32_t at,
> +                                     bool *busy)
> +{
> +    unsigned int blockmask_slots =3D (cc->caps->ncblks + 63) / 64;
> +
> +    memcpy(cc->alloc_blockmasks,
> +           get_blockmask_location(cc, rcid, at),
> +           blockmask_slots * 8);
> +    return CC_ALLOC_STATUS_SUCCESS;
> +}
> +
> +static uint32_t alloc_blockmask_init(RiscvCbqriCapacityState *cc,
> +                                     uint32_t rcid, uint32_t at, bool se=
t,
> +                                     bool *busy)
> +{
> +    void *blockmask =3D get_blockmask_location(cc, rcid, at);
> +
> +    if (set) {
> +        bitmap_fill(blockmask, cc->caps->ncblks);
> +    } else {
> +        bitmap_zero(blockmask, cc->caps->ncblks);
> +    }
> +    return CC_ALLOC_STATUS_SUCCESS;
> +}
> +
> +static bool is_valid_at(RiscvCbqriCapacityState *cc, uint32_t at)
> +{
> +    switch (at) {
> +    case CC_AT_DATA:
> +        return cc->caps->supports_at_data;
> +    case CC_AT_CODE:
> +        return cc->caps->supports_at_code;
> +    default:
> +        return false;
> +    }
> +}
> +
> +static void riscv_cbqri_cc_write_mon_ctl(RiscvCbqriCapacityState *cc,
> +                                         uint64_t value)
> +{
> +    if (!cc->caps->supports_mon_op_config_event &&
> +        !cc->caps->supports_mon_op_read_counter) {
> +        /* monitoring not supported: leave mon_ctl set to 0 */
> +        return;
> +    }
> +
> +    /* extract writable fields */
> +    uint32_t op =3D FIELD_EX64(value, CC_MON_CTL, OP);
> +    uint32_t at =3D FIELD_EX64(value, CC_MON_CTL, AT);
> +    uint32_t mcid =3D FIELD_EX64(value, CC_MON_CTL, MCID);
> +    uint32_t evt_id =3D FIELD_EX64(value, CC_MON_CTL, EVT_ID);
> +    bool atv =3D FIELD_EX64(value, CC_MON_CTL, ATV);
> +
> +    /* extract read-only fields */
> +    uint32_t status =3D FIELD_EX64(cc->cc_mon_ctl, CC_MON_CTL, STATUS);
> +    bool busy =3D FIELD_EX64(cc->cc_mon_ctl, CC_MON_CTL, BUSY);
> +
> +    if (busy) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: busy flag still set, ignored",
> +                      __func__);
> +        return;
> +    }
> +
> +    if (!cc->caps->supports_at_data &&
> +        !cc->caps->supports_at_code) {
> +        /* AT not supported: hardwire to 0 */
> +        at =3D 0;
> +        atv =3D false;
> +    }
> +
> +    if (mcid >=3D cc->caps->nb_mcids) {
> +        status =3D CC_MON_CTL_STATUS_INVAL_MCID;
> +    } else if (op =3D=3D CC_MON_OP_CONFIG_EVENT &&
> +               cc->caps->supports_mon_op_config_event) {
> +        if (evt_id =3D=3D CC_EVT_ID_None &&
> +            cc->caps->supports_mon_evt_id_none) {
> +            cc->mon_counters[mcid].active =3D false;
> +            status =3D CC_MON_CTL_STATUS_SUCCESS;
> +        } else if (evt_id =3D=3D CC_EVT_ID_Occupancy &&
> +                   cc->caps->supports_mon_evt_id_occupancy) {
> +            if (atv && !is_valid_at(cc, at)) {
> +                status =3D CC_MON_CTL_STATUS_INVAL_AT;
> +            } else {
> +                cc->mon_counters[mcid].ctr_val =3D
> +                    FIELD_DP64(0, CC_MON_CTR_VAL, INVALID, 1);
> +                cc->mon_counters[mcid].evt_id =3D evt_id;
> +                cc->mon_counters[mcid].at =3D atv ? at : -1;
> +                cc->mon_counters[mcid].active =3D true;
> +                status =3D CC_MON_CTL_STATUS_SUCCESS;
> +            }
> +        } else {
> +            status =3D CC_MON_CTL_STATUS_INVAL_EVT_ID;
> +        }
> +    } else if (op =3D=3D CC_MON_OP_READ_COUNTER &&
> +               cc->caps->supports_mon_op_read_counter) {
> +        cc->cc_mon_ctr_val =3D cc->mon_counters[mcid].ctr_val;
> +        status =3D CC_MON_CTL_STATUS_SUCCESS;
> +    } else {
> +        status =3D CC_MON_CTL_STATUS_INVAL_OP;
> +    }
> +
> +    /* reconstruct updated register value */
> +    value =3D 0;
> +    value =3D FIELD_DP64(value, CC_MON_CTL, OP, op);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, AT, at);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, MCID, mcid);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, EVT_ID, evt_id);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, ATV, atv);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, STATUS, status);
> +    value =3D FIELD_DP64(value, CC_MON_CTL, BUSY, busy);
> +    cc->cc_mon_ctl =3D value;
> +}
> +
> +static void riscv_cbqri_cc_write_alloc_ctl(RiscvCbqriCapacityState *cc,
> +                                           uint64_t value)
> +{
> +    if (cc->caps->ncblks =3D=3D 0 ||
> +        (!cc->caps->supports_alloc_op_config_limit &&
> +         !cc->caps->supports_alloc_op_read_limit &&
> +         !cc->caps->supports_alloc_op_flush_rcid)) {
> +        /* capacity allocation not supported: leave alloc_ctl set to 0 *=
/
> +        return;
> +    }
> +
> +    /* extract writable fields */
> +    uint32_t op =3D FIELD_EX64(value, CC_ALLOC_CTL, OP);
> +    uint32_t at =3D FIELD_EX64(value, CC_ALLOC_CTL, AT);
> +    uint32_t rcid =3D FIELD_EX64(value, CC_ALLOC_CTL, RCID);
> +
> +    /* extract read-only fields */
> +    uint32_t status =3D FIELD_EX64(cc->cc_alloc_ctl, CC_ALLOC_CTL, STATU=
S);
> +    bool busy =3D FIELD_EX64(cc->cc_alloc_ctl, CC_ALLOC_CTL, BUSY);
> +
> +    if (busy) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: busy flag still set, ignored",
> +                      __func__);
> +        return;
> +    }
> +
> +    bool atv =3D true;
> +    if (!cc->caps->supports_at_data &&
> +        !cc->caps->supports_at_code) {
> +        /* AT not supported: hardwire to 0 */
> +        at =3D 0;
> +        atv =3D false;
> +    }
> +
> +    if (rcid >=3D cc->caps->nb_rcids) {
> +        status =3D CC_ALLOC_STATUS_INVAL_RCID;
> +    } else if (atv && !is_valid_at(cc, at)) {
> +        status =3D CC_ALLOC_STATUS_INVAL_AT;
> +    } else if (op =3D=3D CC_ALLOC_OP_CONFIG_LIMIT &&
> +               cc->caps->supports_alloc_op_config_limit) {
> +        status =3D alloc_blockmask_config(cc, rcid, at, &busy);
> +    } else if (op =3D=3D CC_ALLOC_OP_READ_LIMIT &&
> +               cc->caps->supports_alloc_op_read_limit) {
> +        status =3D alloc_blockmask_read(cc, rcid, at, &busy);
> +    } else if (op =3D=3D CC_ALLOC_OP_FLUSH_RCID &&
> +               cc->caps->supports_alloc_op_flush_rcid) {
> +        status =3D alloc_blockmask_init(cc, rcid, at, false, &busy);
> +    } else {
> +        status =3D CC_ALLOC_STATUS_INVAL_OP;
> +    }
> +
> +    /* reconstruct updated register value */
> +    value =3D 0;
> +    value =3D FIELD_DP64(value, CC_ALLOC_CTL, OP, op);
> +    value =3D FIELD_DP64(value, CC_ALLOC_CTL, AT, at);
> +    value =3D FIELD_DP64(value, CC_ALLOC_CTL, RCID, rcid);
> +    value =3D FIELD_DP64(value, CC_ALLOC_CTL, STATUS, status);
> +    value =3D FIELD_DP64(value, CC_ALLOC_CTL, BUSY, busy);
> +    cc->cc_alloc_ctl =3D value;
> +}
> +
> +static void riscv_cbqri_cc_write(void *opaque, hwaddr addr,
> +                                 uint64_t value, unsigned size)
> +{
> +    RiscvCbqriCapacityState *cc =3D opaque;
> +
> +    assert((addr % 8) =3D=3D 0);
> +    assert(size =3D=3D 8);
> +
> +    switch (addr) {
> +    case A_CC_CAPABILITIES:
> +        /* read-only register */
> +        break;
> +    case A_CC_MON_CTL:
> +        riscv_cbqri_cc_write_mon_ctl(cc, value);
> +        break;
> +    case A_CC_ALLOC_CTL:
> +        riscv_cbqri_cc_write_alloc_ctl(cc, value);
> +        break;
> +    case A_CC_MON_CTR_VAL:
> +        /* read-only register */
> +        break;
> +    case A_CC_BLOCK_MASK:
> +        if (cc->caps->ncblks =3D=3D 0) {
> +            break;
> +        }
> +        /* fallthrough */
> +    default:
> +        uint32_t blkmask_slot =3D (addr - A_CC_BLOCK_MASK) / 8;
> +        if (blkmask_slot >=3D (cc->caps->ncblks + 63) / 64) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: out of bounds (addr=3D0x%x)",
> +                          __func__, (uint32_t)addr);
> +            break;
> +        }
> +        cc->alloc_blockmasks[blkmask_slot] =3D value;
> +    }
> +}
> +
> +static uint64_t riscv_cbqri_cc_read(void *opaque, hwaddr addr, unsigned =
size)
> +{
> +    RiscvCbqriCapacityState *cc =3D opaque;
> +    uint64_t value =3D 0;
> +
> +    assert((addr % 8) =3D=3D 0);
> +    assert(size =3D=3D 8);
> +
> +    switch (addr) {
> +    case A_CC_CAPABILITIES:
> +        value =3D FIELD_DP64(value, CC_CAPABILITIES, VER_MAJOR,
> +                           RISCV_CBQRI_VERSION_MAJOR);
> +        value =3D FIELD_DP64(value, CC_CAPABILITIES, VER_MINOR,
> +                           RISCV_CBQRI_VERSION_MINOR);
> +        value =3D FIELD_DP64(value, CC_CAPABILITIES, NCBLKS,
> +                           cc->caps->ncblks);
> +        value =3D FIELD_DP64(value, CC_CAPABILITIES, FRCID,
> +                           cc->caps->supports_alloc_op_flush_rcid);
> +        break;
> +    case A_CC_MON_CTL:
> +        value =3D cc->cc_mon_ctl;
> +        break;
> +    case A_CC_ALLOC_CTL:
> +        value =3D cc->cc_alloc_ctl;
> +        break;
> +    case A_CC_MON_CTR_VAL:
> +        value =3D cc->cc_mon_ctr_val;
> +        break;
> +    case A_CC_BLOCK_MASK:
> +        if (cc->caps->ncblks =3D=3D 0) {
> +            break;
> +        }
> +        /* fallthrough */
> +    default:
> +        unsigned int blkmask_slot =3D (addr - A_CC_BLOCK_MASK) / 8;
> +        if (blkmask_slot >=3D (cc->caps->ncblks + 63) / 64) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: out of bounds (addr=3D0x%x)",
> +                          __func__, (uint32_t)addr);
> +            break;
> +        }
> +        value =3D cc->alloc_blockmasks[blkmask_slot];
> +    }
> +
> +    return value;
> +}
> +
> +static const MemoryRegionOps riscv_cbqri_cc_ops =3D {
> +    .read =3D riscv_cbqri_cc_read,
> +    .write =3D riscv_cbqri_cc_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size =3D 4,
> +    .valid.max_access_size =3D 8,
> +    .impl.min_access_size =3D 8,
> +    .impl.max_access_size =3D 8,
> +};
> +
> +static void riscv_cbqri_cc_realize(DeviceState *dev, Error **errp)
> +{
> +    RiscvCbqriCapacityState *cc =3D RISCV_CBQRI_CC(dev);
> +
> +    assert(cc->mon_counters =3D=3D NULL);
> +    cc->mon_counters =3D g_new0(MonitorCounter, cc->caps->nb_mcids);
> +
> +    assert(cc->alloc_blockmasks =3D=3D NULL);
> +    uint64_t *end =3D get_blockmask_location(cc, cc->caps->nb_rcids, 0);
> +    unsigned int blockmasks_size =3D end - cc->alloc_blockmasks;
> +    cc->alloc_blockmasks =3D g_new0(uint64_t, blockmasks_size);
> +
> +    memory_region_init_io(&cc->mmio, OBJECT(dev), &riscv_cbqri_cc_ops,
> +                          cc, TYPE_RISCV_CBQRI_CC, 4 * 1024);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &cc->mmio);
> +}
> +
> +static void riscv_cbqri_cc_reset_enter(Object *obj, ResetType type)
> +{
> +    RiscvCbqriCapacityState *cc =3D RISCV_CBQRI_CC(obj);
> +
> +    cc->cc_mon_ctl =3D 0;
> +    cc->cc_alloc_ctl =3D 0;
> +
> +    /* assign all capacity only to rcid0 */
> +    for (unsigned int rcid =3D 0; rcid < cc->caps->nb_rcids; rcid++) {
> +        bool any_at =3D false;
> +
> +        if (cc->caps->supports_at_data) {
> +            alloc_blockmask_init(cc, rcid, CC_AT_DATA,
> +                                 rcid =3D=3D 0, NULL);
> +            any_at =3D true;
> +        }
> +        if (cc->caps->supports_at_code) {
> +            alloc_blockmask_init(cc, rcid, CC_AT_CODE,
> +                                 rcid =3D=3D 0, NULL);
> +            any_at =3D true;
> +        }
> +        if (!any_at) {
> +            alloc_blockmask_init(cc, rcid, 0,
> +                                 rcid =3D=3D 0, NULL);
> +        }
> +    }
> +}
> +
> +static void riscv_cbqri_cc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    dc->realize =3D riscv_cbqri_cc_realize;
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> +    rc->phases.enter =3D riscv_cbqri_cc_reset_enter;
> +}
> +
> +static const TypeInfo riscv_cbqri_cc_info =3D {
> +    .name          =3D TYPE_RISCV_CBQRI_CC,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(RiscvCbqriCapacityState),
> +    .class_init    =3D riscv_cbqri_cc_class_init,
> +};
> +
> +static void riscv_cbqri_cc_register_types(void)
> +{
> +    type_register_static(&riscv_cbqri_cc_info);
> +}
> +
> +DeviceState *riscv_cbqri_cc_create(hwaddr addr,
> +                                   const RiscvCbqriCapacityCaps *caps,
> +                                   const char *instance_name)
> +{
> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_CBQRI_CC);
> +    RiscvCbqriCapacityState *cc =3D RISCV_CBQRI_CC(dev);
> +
> +    cc->caps =3D caps;
> +    cc->name =3D instance_name;
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    return dev;
> +}
> +
> +type_init(riscv_cbqri_cc_register_types)
> --
> 2.34.1
>
>

