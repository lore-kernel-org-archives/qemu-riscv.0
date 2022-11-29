Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozx8m-00082g-TA
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 04:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozx8j-00081L-RJ; Tue, 29 Nov 2022 04:42:57 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozx8f-0005d2-Io; Tue, 29 Nov 2022 04:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669714974; x=1701250974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oUGUA2bzZQ/mHq0cdDgCa39787Q0UsiecbgD8pDqeVQ=;
 b=xEe4aiPFB0VtT6Uo9x21c3OjZSomfbQNCik21+zxIN1jFKJbZMVijvZ3
 c4Nj7Ro0vq3ZPSOUlhEiYfuosHXKdVvfoYw+0KB/Tkk6L1g5WLu5JTgp1
 cnrjKaBn2ffGxfjswAp15wE8Y4oMOEaBkRcU7vGz0fO0D6RbytioxiiBD
 anZJe78KPi8hHHP8jP9oUGLgErH0/TJuhoSjzjcUwaYLKxLaPzM9h39FG
 vDzwVwA01DvAq7FVUlLcKHzKu26PWMBkRLN6g34S17CaQhJ3c5UhLyNO1
 yNs5aWoMB26+NvqybaRYiMqwTsPd3gn8Fo/Ws1BKbrhQtoB1E8nKa0Ve5 g==;
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="185647809"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Nov 2022 02:42:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 02:42:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 02:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCpikjFsT4Frc8lQyJ6l6X9eyMBk5+uADKW7FdMmG4g8uKHFzoM+ZZlxm3+Vp7XD+a+m9R7P2bd7LM2QJBeGytZEt0YeXZ9WhdzYKpoY8ghJ1f7kf2ceKmloWPuWPikHK9pFeaMqU+KIgZbVb9MT4pfoxyZGdGErGPO9Cz4DzySx1udpvcjVPeyAqUfN/CB0s76o8T8KpLJ3C//NpFFS/JzuAfRVP9WdZvDOakzE/uYZMze9wUrO0ZHzdlt5NWcJsKMmI1QxG25Ct2QqcDofTOLZnEnN8lDu4/hbw/mIwIJx2zmLIiysIxUqt+Z43L3wOgvpZLYwZao7zxo1uk05JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUGUA2bzZQ/mHq0cdDgCa39787Q0UsiecbgD8pDqeVQ=;
 b=kgOB37GYnJm+RSOwKdqoH75VTCHwYRjqOs59vKU5lvwFuOxXM7ZMTGFBBm5UrVszuCRSAcXz5dNd/LpJWieavd4+mCr0/+9/EltMYlGqfJwJDM5eBBRl3uiAlp1RnfEm8fmtGUuJq1aFCc3PO7O8Kw9wk+LYNRq7lPoTWRjcS4bbz6BO0JYvtCSAE+ryZ12ElNQBy8dkNxYOe2gec62x6aKx79tDHI8eLsMwHv5WJ+MHDYoX3BudfTG4pO6QZjKQgzJxZL564FnmwxWuFax2ajf9VSKyh9oXMeUhev/xJwQOetXg5b+KFb01kVKrgPWj6oCeuU2iCvuUEPTBJjFa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUGUA2bzZQ/mHq0cdDgCa39787Q0UsiecbgD8pDqeVQ=;
 b=J4BDvz7Dv/Fk4t/s1nPk56qQ4mewLZYIoa4VjC1k5kvL5l0LwdQCe6BC9AjutS9WW9BLJ7wcQWrFGKBZ1bHSr00erP7Jw/SaqJZXcKzroY5Gc8kogHB20K3tqpLUZMRFdUWIXyMBkZe+3jT/B+UKzQGSl+InZhVkrdJ0DeEIzHA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 09:42:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 09:42:47 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@rivosinc.com>
CC: <ajones@ventanamicro.com>, <qemu-devel@nongnu.org>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <qemu-riscv@nongnu.org>, <samuel@sholland.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKAgAAA1ICAAAftgIAApykAgAAGxoCAACAygIAABBsA
Date: Tue, 29 Nov 2022 09:42:47 +0000
Message-ID: <41abdee4-8d33-193b-9b78-080c75a8fec1@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
 <20221129070820.7varmruxjkhdwoc6@kamzik>
 <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
 <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
In-Reply-To: <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM8PR11MB5669:EE_
x-ms-office365-filtering-correlation-id: a8293209-7201-4383-d2b8-08dad1ee12b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: heRKB/MzDsttAYENb9Aap69RFbn5wJrh0nzxeny87NYmnlAe0L+zROdl1tD2n2zTGeD6VcVJ3vsE/bcPSmmmPmYDM8aJ+zrfpY8qFERKKmuPpQOU68KuqulZvkAcaJcgbo74DtaCeR9u8CaqrVInjuzAy1yx7uHMmy71waQSQJqGKFLEDXtFKhkBQ5ujmJWfKFN90mq/9DYZ7h4flcLtaKbuIAtUGiOBtAC8CGRpsTfvZNEXUWESV5onU0bJgKgyNfvVr8yzfFIcoBcOk03NA9AVQwpIFisoblBPAAK4TKawMb+t8C0FDPdTyjstJQeAPESWLQw406nQw3+RmOIOCnNBI0BWdQU6kF66THCqjjgM9OmKtsA9QXowFfyF1IH+7aJiIIW1kF5Zqqq8wiE6uQoCuUEXcgVEfy4PFpNtpmTd/smZo/WH7BPpdBUQEDcnhY6SEVAMMeOXmLXWKZqd2DFepc+HMkuzrOfpNg8zcEk2QvgpKAeurafKGjSbo6hwuNT3+jL754WVkg0COJQXAgaO6aiLi0jfhsF+qTdlA1g8Y3JaM/SaHFDRspF3A7b6FE1QH9A/FSk6JH8X3/QZpU8urQbnXJ171J5h9em4xhC4Y4gwEsRH9LDARVjeyn3ATk8nmr7ty/jxzPGq0TVVqddodbjBPqh2ggdnbdSnqwrScSwIdSx9dD5HnDLv2ohEPWXMApjrYACGx+KVbAVPyJU6hmTF29aqCRrZDbva0ASfxnHA7LXCaaG7bmAVeWnJbl51EWLIz0NDoxLv3xVZlkkg1G2PrRnn8oCdI+ox7czFaVTzR2Qjec8BarSGizzmzHiZMg7cvvsn7DC812MMvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199015)(6506007)(478600001)(83380400001)(31696002)(86362001)(31686004)(53546011)(6486002)(71200400001)(966005)(54906003)(2616005)(316002)(26005)(6512007)(6916009)(8936002)(41300700001)(5660300002)(38070700005)(2906002)(38100700002)(66556008)(66476007)(4326008)(8676002)(64756008)(36756003)(91956017)(66946007)(186003)(76116006)(66446008)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGZGUUpTVmtXWUw3YzR3SkhXeXlLVXJHWFpUMkh2dGtxd2JmWU9ibll2VEVl?=
 =?utf-8?B?MGdTVXlHODVYdFRjU3cxV052VzNQWWYrNGJBbHUxam15ZTBBK1AwTDluek1V?=
 =?utf-8?B?dWdSeWw3bEFRZnZkZXI2TFRaU05sVnJ2YjZDNmRDdWFjbnlpOWlMMitrcnor?=
 =?utf-8?B?SVR1eFZ4bm5zdXdMYk1sbmZxTllmbDBkaFRjbHpoWkV2eDdZcjRRZnFESzhq?=
 =?utf-8?B?ZSs4RFhNOHZyT2VnS05PVTEwdFBKMnNBcHVuSCtFZWdoVHVjQWZPS0p1ajBY?=
 =?utf-8?B?VjVIaXpHV1ZmSjVpck9jeHlTSUJ6aytBOWdVNXJyRjNOc3ZySnUzWURVVW9L?=
 =?utf-8?B?bjNBckNhclVRUzZ0cUhobHgyU1RrdWR3bnE5VHBXRHF2a2lGSXVLNm9aWWNC?=
 =?utf-8?B?NEJlU3hCRmpWQXUzcHdDRUxoMTYwWXh6cjFnQmg3M1VEcnhDY2VtMlNNMEoy?=
 =?utf-8?B?TGxueEhKV3l3ZUhIb0hOQm4zN1EyRUdtU0hFMlB3QmI4VXVnOUZzRmY3YmVN?=
 =?utf-8?B?UlpDWG9oQlk0L0ZkZDdnK211WnlnenZFMVFaeGk5NVFBUDVzRTE5bDYwalhB?=
 =?utf-8?B?R1BJRmkvMnQyZ2xUOC9GdlJMUXI5U3pacEJFVXJCY0pzbDBvMmorK3ExVXVl?=
 =?utf-8?B?RVNrWnNqTm8rbVhlcDArNUtJOU9QNnBqS0trb1dLK1FObmVhRjR1TnpxMVhF?=
 =?utf-8?B?dk94WDRpSC9nb2ZGWWhkRVAvYzBBUTZqbGtvMVBzWDR3WjNiLzBZMGZIY2di?=
 =?utf-8?B?anJrNm9sdnZiUVoxQ2Y4bm1PL0hPM2tKYmNuaURzREVYRC9JN05qTlZQcjB3?=
 =?utf-8?B?N2cxZ1I1TjhPT01jZThXSjBoTzJRZGw2ZHZGY0ZUQ1ZsSDZJZytkdkpSWWRM?=
 =?utf-8?B?ZTAvNjNQOEVyMzhKUTdwSXg4R2wyU29CcWxqYlZ3S2RCZzhGaUNkUVR2ODJl?=
 =?utf-8?B?SnZ3SThTdHZZa2oyRmlEa1BWVkV1Z2p0MjIybHRJa3pkT1p4MnUwZzI3UVpI?=
 =?utf-8?B?VjlDYnMwNGNxa0laVjNWdGptNzZDaTVDd2YzOWk5VmZja1FKaVI2T1gwejNC?=
 =?utf-8?B?YjBmR0FXbzd4dkRBK1pQT1ZqZ3phM2JsczdDWXU0UWxtY1lrM01UaXBnQWt4?=
 =?utf-8?B?YmNaUVVkbDZ5OFFCKzR2UVhKdHlFSW5hTFdEdENldHUzVXA2bE41WVd2T2VP?=
 =?utf-8?B?b2VYdXBJdUE4SmppZ2pWSm9zY0VmNGQyb3lPV0Z2YWdoVnRnb1NadW9GZXlQ?=
 =?utf-8?B?SlIxR1Zwc0JXZ3Azck9HaW9SMk8xa0hQT0xyZDVsSTFsbnlTUlBmZW4wU1pP?=
 =?utf-8?B?Q1pzdTNuRHd2L3RFcGZvNGxPSkFlMUFYdGcvbXBtTTFwZDBES0hTRzlVNkpM?=
 =?utf-8?B?NUh6LzlSZ3RTekVOdHRKSGN6T2FPaFJ4R2JLMnR3cWdyK2ZGUUp4NjdkMzVZ?=
 =?utf-8?B?QnVid2dLd0UxVGp4elZ4eTZKaFB4b3M3dThuYUp6dnh2YnU1akNTNGp5NDVm?=
 =?utf-8?B?Z3ErelBpanFUMmZ2cVNDYUlmaUhHSkJjUnZhNzVQNW5sc0lLRVBTY1prbDd0?=
 =?utf-8?B?b0hJTmhGdGVVNU1ZUDNJZ1lQNStBRk1ib2JHUkg2dGQySjA0a1RoSytJWEdM?=
 =?utf-8?B?cC9hTWpueldkcDBGL2xHeDdRdW5pbW9YNnFmN2Fla0VXTnRxbWJ6RWhKd0xT?=
 =?utf-8?B?a0toTlhwam4yS21sbmE2dEpoT0JBSWs4VXBRL1VOeFJhV1U4eFBGcC8xMnpm?=
 =?utf-8?B?eDJuZ0p2aXJvME1JU0NKOXUwd0FYQis2RGpjRFVhYWF2UmhaYWY3U0MwYWV3?=
 =?utf-8?B?cDJSNlRTMmJhVk4zci9YMGh5L2FmVGVOTG1Xc1hZandCemo5NlV3R1k4cHFW?=
 =?utf-8?B?RzZUOTViaTNBck1ZYVcza2xTR1FiRkc2MnlQaStzMlNVeEptUXNKVmxKWDQ2?=
 =?utf-8?B?QkNITmc1a3Y4KzIzNy9vQVQxUUpXd01MT2hOYVA3REpkLzhYQXpUT3ZKUGVP?=
 =?utf-8?B?c0xhWm4vY3JveE9xQzhpSmsyTDI4MmRHM1VMUER1N1lBUmt1Si9MTU56RG5i?=
 =?utf-8?B?UWF5OCtPSi9saitqSC9PZUZhZDZQajNYb1c3YjBWY0NqZ3dZeUQvdFJCZ2JO?=
 =?utf-8?Q?CBU1SexXxesJnu4eZzPB2D4lD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFA8EB330C70CF479FE428497005E6F8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8293209-7201-4383-d2b8-08dad1ee12b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 09:42:47.2180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yi0fVP5fHliSpB8i9Vu1RXIuat4oPQAOYtO1HlKOJ5HprkOZxiqAagNbCe0wYH0gwVJ3MCL8gOc3dqr5khiIiys+AR09fUKLo1akitLWn00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 29 Nov 2022 09:42:58 -0000

T24gMjkvMTEvMjAyMiAwOToyNywgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBOb3YgMjgsIDIwMjIgYXQg
MTE6MzIgUE0gPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+DQo+PiBPbiAy
OS8xMS8yMDIyIDA3OjA4LCBBbmRyZXcgSm9uZXMgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiBNb24sIE5vdiAyOCwgMjAyMiBhdCAwOTox
MDowM1BNICswMDAwLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24g
MjgvMTEvMjAyMiAyMDo0MSwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+Pj4+PiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+Pj4+PiBPbiBNb24sIE5vdiAyOCwg
MjAyMiBhdCAxMjozOCBQTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOg0KPj4+
Pj4+DQo+Pj4+Pj4gT24gMjgvMTEvMjAyMiAyMDoxNiwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6
DQo+Pj4+Pj4+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDU6MTcgQU0gQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gT24g
V2VkLCBBdWcgMjQsIDIwMjIgYXQgMDM6MTc6MDBQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
DQo+Pj4+Pj4+Pj4gUWVtdSB2aXJ0IG1hY2hpbmUgY2FuIHN1cHBvcnQgZmV3IGNhY2hlIGV2ZW50
cyBhbmQgY3ljbGUvaW5zdHJldCBjb3VudGVycy4NCj4+Pj4+Pj4+PiBJdCBhbHNvIHN1cHBvcnRz
IGNvdW50ZXIgb3ZlcmZsb3cgZm9yIHRoZXNlIGV2ZW50cy4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
IEFkZCBhIERUIG5vZGUgc28gdGhhdCBPcGVuU0JJL0xpbnV4IGtlcm5lbCBpcyBhd2FyZSBvZiB0
aGUgdmlydCBtYWNoaW5lDQo+Pj4+Pj4+Pj4gY2FwYWJpbGl0aWVzLiBUaGVyZSBhcmUgc29tZSBk
dW1teSBub2RlcyBhZGRlZCBmb3IgdGVzdGluZyBhcyB3ZWxsLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
IEhleSBBdGlzaCENCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIHdhcyBmaWRkbGluZyB3aXRoIGR1bXBp
bmcgdGhlIHZpcnQgbWFjaGluZSBkdGIgYWdhaW4gdG9kYXkgdG8gY2hlY2sNCj4+Pj4+Pj4+IHNv
bWUgZHQtYmluZGluZyBjaGFuZ2VzIEkgd2FzIG1ha2luZyBmb3IgdGhlIGlzYSBzdHJpbmcgd291
bGQgcGxheQ0KPj4+Pj4+Pj4gbmljZWx5IHdpdGggdGhlIHZpcnQgbWFjaGluZSAmIEkgbm90aWNl
ZCB0aGF0IHRoaXMgcGF0Y2ggaGFzIGludHJvZHVjZWQNCj4+Pj4+Pj4+IGEgbmV3IHZhbGlkYXRp
b24gZmFpbHVyZToNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAuL2J1aWxkL3FlbXUtc3lzdGVtLXJpc2N2
NjQgLW5vZ3JhcGhpYyAtbWFjaGluZSB2aXJ0LGR1bXBkdGI9cWVtdS5kdGINCj4+Pj4+Pj4+DQo+
Pj4+Pj4+PiBkdC12YWxpZGF0ZSAtcCAuLi9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcHJvY2Vzc2VkLXNjaGVtYS5qc29uIHFlbXUuZHRiDQo+Pj4+Pj4+PiAvaG9tZS9j
b25vci9zdHVmZi9xZW11L3FlbXUuZHRiOiBzb2M6IHBtdTogeydyaXNjdixldmVudC10by1taHBt
Y291bnRlcnMnOiBbWzEsIDEsIDUyNDI4MSwgMiwgMiwgNTI0Mjg0LCA2NTU2MSwgNjU1NjEsIDUy
NDI4MCwgNjU1NjMsIDY1NTYzLCA1MjQyODAsIDY1NTY5LCA2NTU2OSwgNTI0MjgwLCAwLCAwLCAw
LCAwLCAwXV0sICdjb21wYXRpYmxlJzogWydyaXNjdixwbXUnXX0gc2hvdWxkIG5vdCBiZSB2YWxp
ZCB1bmRlciB7J3R5cGUnOiAnb2JqZWN0J30NCj4+Pj4+Pj4+ICAgICAgICAgICBGcm9tIHNjaGVt
YTogL2hvbWUvY29ub3IvLmxvY2FsL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvZHRzY2hl
bWEvc2NoZW1hcy9zaW1wbGUtYnVzLnlhbWwNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIGFzc3VtZSB0
aGlzIGlzIHRoZSBhZm9yZW1lbnRpb25lZCAiZHVtbXkiIG5vZGUgJiB5b3UgaGF2ZSBubyBpbnRl
bnRpb24NCj4+Pj4+Pj4+IG9mIGNyZWF0aW5nIGEgYmluZGluZyBmb3IgdGhpcz8NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEl0IGlzIGEgZHVtbXkgbm9kZSBmcm9tIExpbnV4IGtlcm5lbCBw
ZXJzcGVjdGl2ZS4gT3BlblNiaSB1c2UgdGhpcw0KPj4+Pj4+PiBub2RlIHRvIGZpZ3VyZSBvdXQg
dGhlIGhwbWNvdW50ZXIgbWFwcGluZ3MuDQo+Pj4+Pj4NCj4+Pj4+PiBBeWUsIGJ1dCBzaG91bGQg
aXQgbm90IGhhdmUgYSBiaW5kaW5nIGFueXdheSwgc2luY2UgdGhleSdyZSBub3QNCj4+Pj4+PiBt
ZWFudCB0byBiZSBsaW51eCBzcGVjaWZpYz8NCj4+Pj4+Pg0KPj4+Pj4gSXQgaXMgZG9jdW1lbnRl
ZCBpbiBPcGVuU0JJLg0KPj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNy
Yy9vcGVuc2JpL2Jsb2IvbWFzdGVyL2RvY3MvcG11X3N1cHBvcnQubWQNCj4+Pj4+DQo+Pj4+PiBB
cmUgeW91IHN1Z2dlc3RpbmcgdGhhdCBhbnkgbm9uLUxpbnV4IHNwZWNpZmljIERUIG5vZGVzIHNo
b3VsZCBiZSBwYXJ0DQo+Pj4+PiBvZiBMaW51eCBEVCBiaW5kaW5nIGFzIHdlbGwgPw0KPj4+Pg0K
Pj4+PiBJIHRob3VnaHQgdGhlIHBvaW50IHdhcyB0aGF0IHRoZXkgd2VyZSAqbm90KiBtZWFudCB0
byBiZSBsaW51eCBzcGVjaWZpYywNCj4+Pj4ganVzdCBoYXBwZW5pbmcgdG8gYmUgaG91c2VkIHRo
ZXJlLg0KPj4+Pg0KPj4+DQo+Pj4gSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgYW4gb2ZmaWNpYWwg
cG9saWN5IG9uIHdoZXJlIERUIG5vZGVzIHNob3VsZCBiZQ0KPj4+IHNwZWNpZmllZCwgYnV0IGl0
IGxvb2tzIGxpa2UgU2FtdWVsJ3Mgb3BpbmlvbiBpcyB0aGF0IHRoZXkgc2hvdWxkIGxpdmUNCj4+
PiBpbiB0aGUgTGludXgga2VybmVsLCB3aGV0aGVyIHRoZXkncmUgdXNlZCB0aGVyZSBvciBub3Qg
WzFdLg0KPj4+DQo+Pj4gWzFdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9v
cGVuc2JpLzIwMjItT2N0b2Jlci8wMDM1MjIuaHRtbA0KPj4NCj4+IFlhaCwgdGhhdCB3YXMgYWxz
byBteSB1bmRlcnN0YW5kaW5nLiBTZWUgYWxzbyBVLUJvb3QgbW92aW5nIHRvIHVuaWZ5DQo+PiB0
aGVpciBjdXN0b20gYmluZGluZ3MgaW50byB0aGUgbGludXggcmVwbzoNCj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyMjA5MzAwMDE0MTAuMjgwMjg0My0xLXNq
Z0BjaHJvbWl1bS5vcmcvDQo+Pg0KPiANCj4gVGhpcyBhZGRzIHRoZSBVLUJvb3Qgc3BlY2lmaWMg
RFQgcHJvcGVydGllcyB0byB0aGUgZHRzIHNjaGVtYSBpdHNlbGYsDQo+IG5vdCBMaW51eCBrZXJu
ZWwgRFQgYmluZGluZ3MuDQoNClllYWgsIHNvcnJ5LiBJIG11ZGRsZWQgdGhpbmdzIHVwIGEgbGl0
dGxlIHRoZXJlLiBNeSBwb2ludCB3YXMgdGhhdCB0aGV5DQphcmUgdHJ5aW5nIHRvIGdldCB0byBh
IHN0YWdlIHdoZXJlIGR0LXZhbGlkYXRlIGFuZCB0aG9zZSB0b29scyB3b3JrIGZvcg0KdGhlbSB0
b28uIEknbSBub3Qgc3VyZSB3ZXJlIEkgc2FpZCAibGludXggcmVwbyIgcmF0aGVyIHRoYW4gImR0
LXNjaGVtYQ0KcmVwbyIgd2hlbiBJIGRvdWJsZSBjaGVja2VkIHRoZSBmaWxlIHBhdGhzIGluIHRo
ZSBsaW5rIGJlZm9yZSBwYXN0aW5nIGl0DQp0byBtYWtlIHN1cmUgaXQgd2FzIHRoZSBkdC1zY2hl
bWEgb25lLi4gSSBibGFtZSBpdCBiZWluZyBlYXJseS4NCg0KPiBJIGFtIG5vdCBvcHBvc2VkIHRv
IGFkZGluZyBQTVUgRFQgYmluZGluZ3MgdG8gTGludXggYnV0IHRoZXJlIHNob3VsZA0KPiBiZSBh
IGNsZWFyIHBvbGljeSBvbiB0aGlzLg0KPiBXaGF0IGFib3V0IE9wZW5TQkkgZG9tYWluIERUIGJp
bmRpbmdzID8NCj4gSWYgZXZlcnkgb3RoZXIgRFQgYmFzZWQgb3BlbiBzb3VyY2UgcHJvamVjdCBz
dGFydHMgYWRkaW5nIHRoZWlyIERUDQo+IGJpbmRpbmcgdG8gdGhlIExpbnV4IGtlcm5lbCwgdGhh
dCBtYXkgZ28gZG93bmhpbGwgcHJldHR5IHNvb24uDQoNCk1heWJlIEkgYW0gbWlzdW5kZXJzdGFu
ZGluZywgYnV0IEkgaGFkIHRob3VnaHQgdGhlIGdvYWwgd2FzIHRvIGdldCB0bw0KdXNlci1pbmRl
cGVuZGVudCBiaW5kaW5ncy4gUm9iIGFuZCBLcnp5c3p0b2YgY2VydGFpbmx5IGxhYm91ciB0aGUg
cG9pbnQNCnRoYXQgdGhlIGJpbmRpbmdzIHNob3VsZCBub3QgcmVmbGVjdCBob3cgb25lIG9wZXJh
dGluZyBzeXN0ZW0ncyBkcml2ZXJzDQp3b3VsZCBsaWtlIHRvIHNlZSB0aGVtICYgdS1ib290IG9y
IEZyZWVCU0QgdXNpbmcgYSBwcm9wZXJ0eSBpcyBncm91bmRzDQpmb3IgaXQgbm90IGJlaW5nIHJl
bW92ZWQgZnJvbSB0aGUgYmluZGluZ3MgaW4gdGhlIGxpbnV4IHRyZWUuDQoNCkknbGwgZ28gYW5k
IGFjdHVhbGx5IGFzayBSb2IuDQoNCg0K

